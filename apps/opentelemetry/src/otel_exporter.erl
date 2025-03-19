%%%------------------------------------------------------------------------
%% Copyright 2019, OpenTelemetry Authors
%% Licensed under the Apache License, Version 2.0 (the "License");
%% you may not use this file except in compliance with the License.
%% You may obtain a copy of the License at
%%
%% http://www.apache.org/licenses/LICENSE-2.0
%%
%% Unless required by applicable law or agreed to in writing, software
%% distributed under the License is distributed on an "AS IS" BASIS,
%% WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
%% See the License for the specific language governing permissions and
%% limitations under the License.
%%
%% @doc
%% @end
%%%-----------------------------------------------------------------------
-module(otel_exporter).

-export([init/1,
         export_traces/4,
         export_metrics/4,
         export_logs/4,
         export_traces/3,
         export_metrics/3,
         export_logs/3,
         shutdown/1,
         report_cb/1]).

%% Kept only for backwards compatibility. Look at `otel_exporter_traces', `otel_exporter_metrics'
%% and `otel_exporter_logs' instead.
-callback init(term()) -> {ok, term()} | ignore.

%% Kept only for backwards compatibility. Look at `otel_exporter_traces', `otel_exporter_metrics'
%% and `otel_exporter_logs' instead.
-callback export(traces | logs | metrics, ets:tab(), otel_resource:t(), term()) -> ok |
                                                                                   success |
                                                                                   failed_not_retryable |
                                                                                   failed_retryable.

%% Kept only for backwards compatibility. Look at `otel_exporter_traces', `otel_exporter_metrics'
%% and `otel_exporter_logs' instead.failed_retryable.
-callback shutdown(term()) -> ok.

-include_lib("kernel/include/logger.hrl").

init({ExporterModule, Config}) when is_atom(ExporterModule) ->
    try ExporterModule:init(Config) of
        {ok, ExporterState} when ExporterModule =:= opentelemetry_exporter ->
            %% since we log when the initialization failed so the user knows it later succeeded
            ?LOG_INFO("OTLP exporter successfully initialized"),
            {ExporterModule, ExporterState};
        {ok, ExporterState} ->
            ?LOG_INFO("Exporter ~tp successfully initialized", [ExporterModule]),
            {ExporterModule, ExporterState};
        ignore ->
            undefined
    catch
        Kind:Reason:StackTrace ->
            %% logging in debug level since config argument in stacktrace could have secrets
            ?LOG_DEBUG(#{source => exporter,
                         during => init,
                         kind => Kind,
                         reason => Reason,
                         exporter => ExporterModule,
                         stacktrace => StackTrace}, #{report_cb => fun ?MODULE:report_cb/1}),

            %% print a more useful message about the failure if we can discern
            %% one from the failure reason and exporter used
            case {Kind, Reason} of
                {error, badarg} when ExporterModule =:= opentelemetry_exporter ->
                    case maps:get(protocol, Config, undefined) of
                        grpc ->
                            %% grpc protocol uses grpcbox which is not included by default
                            %% this will check if it is available so we can warn the user if
                            %% the dependency needs to be added
                            try grpcbox:module_info() of
                                _ ->
                                    undefined
                            catch
                                _:_ ->
                                    ?LOG_WARNING("OTLP exporter failed to initialize when using the GRPC "
                                                 "protocol and `grpcbox` module is not available in the "
                                                 "code path. Verify that you have the `grpcbox` dependency "
                                                 "included and rerun.", []),
                                    undefined
                            end;
                        _ ->
                            %% same as the debug log above
                            %% without the stacktrace and at a higher level
                            ?LOG_WARNING(#{source => exporter,
                                           during => init,
                                           kind => Kind,
                                           reason => Reason,
                                           exporter => ExporterModule}, #{report_cb => fun ?MODULE:report_cb/1}),
                            undefined
                    end;
                {error, undef} when ExporterModule =:= opentelemetry_exporter ->
                    ?LOG_WARNING("OTLP exporter module `opentelemetry_exporter` not found. "
                                 "Verify you have included the `opentelemetry_exporter` dependency."),
                    undefined;
                {error, undef} ->
                    ?LOG_WARNING("Exporter module ~tp not found. Verify you have included "
                                 "the dependency that contains the exporter module.", [ExporterModule]),
                    undefined;
                _ ->
                    %% same as the debug log above
                    %% without the stacktrace and at a higher level
                    ?LOG_WARNING(#{source => exporter,
                                   during => init,
                                   kind => Kind,
                                   reason => Reason,
                                   exporter => ExporterModule}, #{report_cb => fun ?MODULE:report_cb/1}),
                    undefined
            end
    end;
init(Exporter) when Exporter =:= none ; Exporter =:= undefined ->
    undefined;
init(ExporterModule) when is_atom(ExporterModule) ->
    init({ExporterModule, []}).

export_traces({ExporterModule, Config}, SpansTid, Resource) ->
    ExporterModule:export(traces, SpansTid, Resource, Config).

export_metrics({ExporterModule, Config}, MetricsTid, Resource) ->
    ExporterModule:export(metrics, MetricsTid, Resource, Config).

export_logs({ExporterModule, Config}, Batch, Resource) ->
    ExporterModule:export(logs, Batch, Resource, Config).

%% below export_* functions are for backwards compatibility

export_traces(ExporterModule, SpansTid, Resource, Config) ->
    ExporterModule:export(traces, SpansTid, Resource, Config).

export_metrics(ExporterModule, MetricsTid, Resource, Config) ->
    ExporterModule:export(metrics, MetricsTid, Resource, Config).

export_logs(ExporterModule, Batch, Resource, Config) ->
    ExporterModule:export(logs, Batch, Resource, Config).

shutdown(undefined) ->
    ok;
shutdown({ExporterModule, Config}) ->
    ExporterModule:shutdown(Config).

report_cb(#{source := exporter,
            during := init,
            kind := Kind,
            reason := Reason,
            exporter := opentelemetry_exporter,
            stacktrace := StackTrace}) ->
    {"OTLP exporter failed to initialize: ~ts",
     [otel_utils:format_exception(Kind, Reason, StackTrace)]};
report_cb(#{source := exporter,
            during := init,
            kind := Kind,
            reason := Reason,
            exporter := ExporterModule,
            stacktrace := StackTrace}) ->
    {"Exporter ~tp failed to initialize: ~ts",
     [ExporterModule, otel_utils:format_exception(Kind, Reason, StackTrace)]};
report_cb(#{source := exporter,
            during := init,
            kind := Kind,
            reason := Reason,
            exporter := opentelemetry_exporter}) ->
    {"OTLP exporter failed to initialize with exception ~tp:~tp", [Kind, Reason]};
report_cb(#{source := exporter,
            during := init,
            kind := Kind,
            reason := Reason,
            exporter := ExporterModule}) ->
    {"Exporter ~p failed to initialize with exception ~tp:~tp", [ExporterModule, Kind, Reason]}.
