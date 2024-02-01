%%%------------------------------------------------------------------------
%% Copyright 2022, OpenTelemetry Authors
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
%%%-------------------------------------------------------------------------
-module(otel_aggregation_last_value).

-behaviour(otel_aggregation).

-export([init/2,
         aggregate/4,
         collect/3]).

-include_lib("opentelemetry_api_experimental/include/otel_metrics.hrl").
-include("otel_metrics.hrl").

-type t() :: #last_value_aggregation{}.

-export_type([t/0]).

-include_lib("opentelemetry_api/include/gradualizer.hrl").
-include("otel_view.hrl").

init(#view_aggregation{name=Name,
                       reader=ReaderId,
                       aggregation_options=_Options,
                       forget=Forget}, Attributes) ->
    Generation = case Forget of
                     true ->
                         otel_metric_reader:checkpoint_generation(ReaderId);
                     _ ->
                         0
                 end,
    Key = {Name, Attributes, ReaderId, Generation},
    #last_value_aggregation{key=Key,
                            start_time=opentelemetry:timestamp(),
                            value=undefined}.

aggregate(Tab, ViewAggregation=#view_aggregation{name=Name,
                                                 reader=ReaderId,
                                                 forget=Forget}, Value, Attributes) ->
    Generation = case Forget of
                     true ->
                         otel_metric_reader:checkpoint_generation(ReaderId);
                     _ ->
                         0
                 end,
    Key = {Name, Attributes, ReaderId, Generation},
    case ets:update_element(Tab, Key, {#last_value_aggregation.value, Value}) of
        true ->
            true;
        false ->
            Metric = init(ViewAggregation, Attributes),
            ets:insert(Tab, ?assert_type((?assert_type(Metric, #last_value_aggregation{}))#last_value_aggregation{value=Value}, tuple()))
    end.

checkpoint(Tab, #view_aggregation{name=Name,
                                  reader=ReaderId,
                                  temporality=?TEMPORALITY_DELTA}, Generation) ->
    MS = [{#last_value_aggregation{key={Name, '$1', ReaderId, Generation},
                                   start_time='$3',
                                   checkpoint='_',
                                   value='$2'},
           [],
           [{#last_value_aggregation{key={{Name, '$1', {const, ReaderId}, {const, Generation}}},
                                     start_time='$3',
                                     checkpoint='$2',
                                     value='$2'}}]}],
    _ = ets:select_replace(Tab, MS),

    ok;
checkpoint(Tab, #view_aggregation{name=Name,
                                  reader=ReaderId}, Generation) ->
    MS = [{#last_value_aggregation{key={Name, '$1', ReaderId, Generation},
                                   start_time='$3',
                                   checkpoint='_',
                                   value='$2'},
           [],
           [{#last_value_aggregation{key={{{const, Name}, '$1', {const, ReaderId}, {const, Generation}}},
                                     start_time='$3',
                                     checkpoint='$2',
                                     value='$2'}}]}],
    _ = ets:select_replace(Tab, MS),

    ok.


collect(Tab, ViewAggregation=#view_aggregation{name=Name,
                                               reader=ReaderId,
                                               forget=Forget}, Generation0) ->
    CollectionStartTime = opentelemetry:timestamp(),
    Generation = case Forget of
                     true ->
                         Generation0;
                     _ ->
                         0
                 end,

    checkpoint(Tab, ViewAggregation, Generation),

    Select = [{#last_value_aggregation{key={Name, '_', ReaderId, Generation},
                                       _='_'}, [], ['$_']}],
    AttributesAggregation = ets:select(Tab, Select),
    #gauge{datapoints=[datapoint(CollectionStartTime, LastValueAgg) ||
                          LastValueAgg <- AttributesAggregation]}.

%%

datapoint(CollectionStartTime, #last_value_aggregation{key={_, Attributes, _, _},
                                                       start_time=StartTime,
                                                       checkpoint=Checkpoint}) ->
    #datapoint{attributes=Attributes,
               %% `start_time' being set to `last_start_time' causes complaints
               %% because `last_start_time' has matchspec values in its typespec
               %% eqwalizer:ignore see above
               start_time=StartTime,
               time=CollectionStartTime,
               %% eqwalizer:ignore more matchspec fun
               value=Checkpoint,
               exemplars=[],
               flags=0}.
