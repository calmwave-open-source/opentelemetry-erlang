defmodule OpenTelemetry.SemConv.OtelAttributes do
  # This is an auto-generated file
  @moduledoc """
  OpenTelemetry Semantic Conventions for Otel attributes.
  """

  @doc """
  The name of the instrumentation scope - (`InstrumentationScope.Name` in OTLP).
  ### Value type

  Value must be of type `atom() | String.t()`.
  ### Examples

  ```
  ["io.opentelemetry.contrib.mongodb"]
  ```

  <!-- tabs-open -->

  ### Elixir

      iex> OpenTelemetry.SemConv.OtelAttributes.otel_scope_name()
      :"otel.scope.name"

  ### Erlang

  ```erlang
  ?OTEL_SCOPE_NAME.
  'otel.scope.name'
  ```

  <!-- tabs-close -->
  """
  @spec otel_scope_name :: :"otel.scope.name"
  def otel_scope_name do
    :"otel.scope.name"
  end

  @doc """
  The version of the instrumentation scope - (`InstrumentationScope.Version` in OTLP).
  ### Value type

  Value must be of type `atom() | String.t()`.
  ### Examples

  ```
  ["1.0.0"]
  ```

  <!-- tabs-open -->

  ### Elixir

      iex> OpenTelemetry.SemConv.OtelAttributes.otel_scope_version()
      :"otel.scope.version"

  ### Erlang

  ```erlang
  ?OTEL_SCOPE_VERSION.
  'otel.scope.version'
  ```

  <!-- tabs-close -->
  """
  @spec otel_scope_version :: :"otel.scope.version"
  def otel_scope_version do
    :"otel.scope.version"
  end

  @typedoc """
  Name of the code, either "OK" or "ERROR". **MUST** **NOT** be set if the status code is UNSET.

  ### Enum Values
  * `:ok` - The operation has been validated by an Application developer or Operator to have completed successfully.
  * `:error` - The operation contains an error.
  """
  @type otel_statuscode_values() :: %{
          :ok => :OK,
          :error => :ERROR
        }
  @doc """
  Name of the code, either "OK" or "ERROR". **MUST** **NOT** be set if the status code is UNSET.


  <!-- tabs-open -->

  ### Elixir

      iex> OpenTelemetry.SemConv.OtelAttributes.otel_statuscode()
      :"otel.status_code"
      
      iex> OpenTelemetry.SemConv.OtelAttributes.otel_statuscode_values().ok
      :OK
      
      iex> %{OpenTelemetry.SemConv.OtelAttributes.otel_statuscode() => OpenTelemetry.SemConv.OtelAttributes.otel_statuscode_values().ok}
      %{:"otel.status_code" => :OK}
      
      iex> OpenTelemetry.SemConv.OtelAttributes.otel_statuscode_values(:custom_value)
      :custom_value

  ### Erlang

  ```erlang
  ?OTEL_STATUSCODE.
  'otel.status_code'

  \#{?OTEL_STATUSCODE => ?OTEL_STATUSCODE_VALUES.ok}.
  \#{'otel.status_code' => OK}

  ?'OTEL_STATUSCODE_VALUES.ok'.
  OK

  ?OTEL_STATUSCODE_VALUES(custom_value).
  custom_value
  ```

  <!-- tabs-close -->
  """
  @spec otel_statuscode :: :"otel.status_code"
  def otel_statuscode do
    :"otel.status_code"
  end

  @spec otel_statuscode_values() :: otel_statuscode_values()
  def otel_statuscode_values() do
    %{
      :ok => :OK,
      :error => :ERROR
    }
  end

  @spec otel_statuscode_values(atom() | String.t()) :: atom() | String.t()
  def otel_statuscode_values(custom_value) do
    custom_value
  end

  @doc """
  Description of the Status if it has a value, otherwise not set.
  ### Value type

  Value must be of type `atom() | String.t()`.
  ### Examples

  ```
  ["resource not found"]
  ```

  <!-- tabs-open -->

  ### Elixir

      iex> OpenTelemetry.SemConv.OtelAttributes.otel_statusdescription()
      :"otel.status_description"

  ### Erlang

  ```erlang
  ?OTEL_STATUSDESCRIPTION.
  'otel.status_description'
  ```

  <!-- tabs-close -->
  """
  @spec otel_statusdescription :: :"otel.status_description"
  def otel_statusdescription do
    :"otel.status_description"
  end
end
