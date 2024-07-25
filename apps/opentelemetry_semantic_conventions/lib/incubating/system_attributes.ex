defmodule OpenTelemetry.SemConv.Incubating.SystemAttributes do
  # This is an auto-generated file
  @moduledoc """
  OpenTelemetry Semantic Conventions for System attributes.
  """

  @doc """
  The logical CPU number [0..n-1]
  ### Value type

  Value must be of type `integer()`.
  ### Examples

  ```
  [1]
  ```

  <!-- tabs-open -->

  ### Elixir

      iex> OpenTelemetry.SemConv.Incubating.SystemAttributes.system_cpu_logicalnumber()
      :"system.cpu.logical_number"

  ### Erlang

  ```erlang
  ?SYSTEM_CPU_LOGICALNUMBER.
  'system.cpu.logical_number'
  ```

  <!-- tabs-close -->
  """
  @spec system_cpu_logicalnumber :: :"system.cpu.logical_number"
  def system_cpu_logicalnumber do
    :"system.cpu.logical_number"
  end

  @typedoc """
  The state of the CPU

  ### Enum Values
  * `:user` ^[e](`m:OpenTelemetry.SemConv#experimental`)^
  * `:system` ^[e](`m:OpenTelemetry.SemConv#experimental`)^
  * `:nice` ^[e](`m:OpenTelemetry.SemConv#experimental`)^
  * `:idle` ^[e](`m:OpenTelemetry.SemConv#experimental`)^
  * `:iowait` ^[e](`m:OpenTelemetry.SemConv#experimental`)^
  * `:interrupt` ^[e](`m:OpenTelemetry.SemConv#experimental`)^
  * `:steal` ^[e](`m:OpenTelemetry.SemConv#experimental`)^
  """
  @type system_cpu_state_values() :: %{
          :user => :user,
          :system => :system,
          :nice => :nice,
          :idle => :idle,
          :iowait => :iowait,
          :interrupt => :interrupt,
          :steal => :steal
        }
  @doc """
  The state of the CPU

  ### Examples

  ```
  ["idle", "interrupt"]
  ```

  <!-- tabs-open -->

  ### Elixir

      iex> OpenTelemetry.SemConv.Incubating.SystemAttributes.system_cpu_state()
      :"system.cpu.state"
      
      iex> OpenTelemetry.SemConv.Incubating.SystemAttributes.system_cpu_state_values().user
      :user
      
      iex> %{OpenTelemetry.SemConv.Incubating.SystemAttributes.system_cpu_state() => OpenTelemetry.SemConv.Incubating.SystemAttributes.system_cpu_state_values().user}
      %{:"system.cpu.state" => :user}
      
      iex> OpenTelemetry.SemConv.Incubating.SystemAttributes.system_cpu_state_values(:custom_value)
      :custom_value

  ### Erlang

  ```erlang
  ?SYSTEM_CPU_STATE.
  'system.cpu.state'

  \#{?SYSTEM_CPU_STATE => ?SYSTEM_CPU_STATE_VALUES.user}.
  \#{'system.cpu.state' => user}

  ?'SYSTEM_CPU_STATE_VALUES.user'.
  user

  ?SYSTEM_CPU_STATE_VALUES(custom_value).
  custom_value
  ```

  <!-- tabs-close -->
  """
  @spec system_cpu_state :: :"system.cpu.state"
  def system_cpu_state do
    :"system.cpu.state"
  end

  @spec system_cpu_state_values() :: system_cpu_state_values()
  def system_cpu_state_values() do
    %{
      :user => :user,
      :system => :system,
      :nice => :nice,
      :idle => :idle,
      :iowait => :iowait,
      :interrupt => :interrupt,
      :steal => :steal
    }
  end

  @spec system_cpu_state_values(atom() | String.t()) :: atom() | String.t()
  def system_cpu_state_values(custom_value) do
    custom_value
  end

  @doc """
  The device identifier
  ### Value type

  Value must be of type `atom() | String.t()`.
  ### Examples

  ```
  ["(identifier)"]
  ```

  <!-- tabs-open -->

  ### Elixir

      iex> OpenTelemetry.SemConv.Incubating.SystemAttributes.system_device()
      :"system.device"

  ### Erlang

  ```erlang
  ?SYSTEM_DEVICE.
  'system.device'
  ```

  <!-- tabs-close -->
  """
  @spec system_device :: :"system.device"
  def system_device do
    :"system.device"
  end

  @doc """
  The filesystem mode
  ### Value type

  Value must be of type `atom() | String.t()`.
  ### Examples

  ```
  ["rw, ro"]
  ```

  <!-- tabs-open -->

  ### Elixir

      iex> OpenTelemetry.SemConv.Incubating.SystemAttributes.system_filesystem_mode()
      :"system.filesystem.mode"

  ### Erlang

  ```erlang
  ?SYSTEM_FILESYSTEM_MODE.
  'system.filesystem.mode'
  ```

  <!-- tabs-close -->
  """
  @spec system_filesystem_mode :: :"system.filesystem.mode"
  def system_filesystem_mode do
    :"system.filesystem.mode"
  end

  @doc """
  The filesystem mount path
  ### Value type

  Value must be of type `atom() | String.t()`.
  ### Examples

  ```
  ["/mnt/data"]
  ```

  <!-- tabs-open -->

  ### Elixir

      iex> OpenTelemetry.SemConv.Incubating.SystemAttributes.system_filesystem_mountpoint()
      :"system.filesystem.mountpoint"

  ### Erlang

  ```erlang
  ?SYSTEM_FILESYSTEM_MOUNTPOINT.
  'system.filesystem.mountpoint'
  ```

  <!-- tabs-close -->
  """
  @spec system_filesystem_mountpoint :: :"system.filesystem.mountpoint"
  def system_filesystem_mountpoint do
    :"system.filesystem.mountpoint"
  end

  @typedoc """
  The filesystem state

  ### Enum Values
  * `:used` ^[e](`m:OpenTelemetry.SemConv#experimental`)^
  * `:free` ^[e](`m:OpenTelemetry.SemConv#experimental`)^
  * `:reserved` ^[e](`m:OpenTelemetry.SemConv#experimental`)^
  """
  @type system_filesystem_state_values() :: %{
          :used => :used,
          :free => :free,
          :reserved => :reserved
        }
  @doc """
  The filesystem state

  ### Examples

  ```
  ["used"]
  ```

  <!-- tabs-open -->

  ### Elixir

      iex> OpenTelemetry.SemConv.Incubating.SystemAttributes.system_filesystem_state()
      :"system.filesystem.state"
      
      iex> OpenTelemetry.SemConv.Incubating.SystemAttributes.system_filesystem_state_values().used
      :used
      
      iex> %{OpenTelemetry.SemConv.Incubating.SystemAttributes.system_filesystem_state() => OpenTelemetry.SemConv.Incubating.SystemAttributes.system_filesystem_state_values().used}
      %{:"system.filesystem.state" => :used}
      
      iex> OpenTelemetry.SemConv.Incubating.SystemAttributes.system_filesystem_state_values(:custom_value)
      :custom_value

  ### Erlang

  ```erlang
  ?SYSTEM_FILESYSTEM_STATE.
  'system.filesystem.state'

  \#{?SYSTEM_FILESYSTEM_STATE => ?SYSTEM_FILESYSTEM_STATE_VALUES.used}.
  \#{'system.filesystem.state' => used}

  ?'SYSTEM_FILESYSTEM_STATE_VALUES.used'.
  used

  ?SYSTEM_FILESYSTEM_STATE_VALUES(custom_value).
  custom_value
  ```

  <!-- tabs-close -->
  """
  @spec system_filesystem_state :: :"system.filesystem.state"
  def system_filesystem_state do
    :"system.filesystem.state"
  end

  @spec system_filesystem_state_values() :: system_filesystem_state_values()
  def system_filesystem_state_values() do
    %{
      :used => :used,
      :free => :free,
      :reserved => :reserved
    }
  end

  @spec system_filesystem_state_values(atom() | String.t()) :: atom() | String.t()
  def system_filesystem_state_values(custom_value) do
    custom_value
  end

  @typedoc """
  The filesystem type

  ### Enum Values
  * `:fat32` ^[e](`m:OpenTelemetry.SemConv#experimental`)^
  * `:exfat` ^[e](`m:OpenTelemetry.SemConv#experimental`)^
  * `:ntfs` ^[e](`m:OpenTelemetry.SemConv#experimental`)^
  * `:refs` ^[e](`m:OpenTelemetry.SemConv#experimental`)^
  * `:hfsplus` ^[e](`m:OpenTelemetry.SemConv#experimental`)^
  * `:ext4` ^[e](`m:OpenTelemetry.SemConv#experimental`)^
  """
  @type system_filesystem_type_values() :: %{
          :fat32 => :fat32,
          :exfat => :exfat,
          :ntfs => :ntfs,
          :refs => :refs,
          :hfsplus => :hfsplus,
          :ext4 => :ext4
        }
  @doc """
  The filesystem type

  ### Examples

  ```
  ["ext4"]
  ```

  <!-- tabs-open -->

  ### Elixir

      iex> OpenTelemetry.SemConv.Incubating.SystemAttributes.system_filesystem_type()
      :"system.filesystem.type"
      
      iex> OpenTelemetry.SemConv.Incubating.SystemAttributes.system_filesystem_type_values().fat32
      :fat32
      
      iex> %{OpenTelemetry.SemConv.Incubating.SystemAttributes.system_filesystem_type() => OpenTelemetry.SemConv.Incubating.SystemAttributes.system_filesystem_type_values().fat32}
      %{:"system.filesystem.type" => :fat32}
      
      iex> OpenTelemetry.SemConv.Incubating.SystemAttributes.system_filesystem_type_values(:custom_value)
      :custom_value

  ### Erlang

  ```erlang
  ?SYSTEM_FILESYSTEM_TYPE.
  'system.filesystem.type'

  \#{?SYSTEM_FILESYSTEM_TYPE => ?SYSTEM_FILESYSTEM_TYPE_VALUES.fat32}.
  \#{'system.filesystem.type' => fat32}

  ?'SYSTEM_FILESYSTEM_TYPE_VALUES.fat32'.
  fat32

  ?SYSTEM_FILESYSTEM_TYPE_VALUES(custom_value).
  custom_value
  ```

  <!-- tabs-close -->
  """
  @spec system_filesystem_type :: :"system.filesystem.type"
  def system_filesystem_type do
    :"system.filesystem.type"
  end

  @spec system_filesystem_type_values() :: system_filesystem_type_values()
  def system_filesystem_type_values() do
    %{
      :fat32 => :fat32,
      :exfat => :exfat,
      :ntfs => :ntfs,
      :refs => :refs,
      :hfsplus => :hfsplus,
      :ext4 => :ext4
    }
  end

  @spec system_filesystem_type_values(atom() | String.t()) :: atom() | String.t()
  def system_filesystem_type_values(custom_value) do
    custom_value
  end

  @typedoc """
  The memory state

  ### Enum Values
  * `:used` ^[e](`m:OpenTelemetry.SemConv#experimental`)^
  * `:free` ^[e](`m:OpenTelemetry.SemConv#experimental`)^
  * `:shared` ^[e](`m:OpenTelemetry.SemConv#experimental`)^
  * `:buffers` ^[e](`m:OpenTelemetry.SemConv#experimental`)^
  * `:cached` ^[e](`m:OpenTelemetry.SemConv#experimental`)^
  """
  @type system_memory_state_values() :: %{
          :used => :used,
          :free => :free,
          :shared => :shared,
          :buffers => :buffers,
          :cached => :cached
        }
  @doc """
  The memory state

  ### Examples

  ```
  ["free", "cached"]
  ```

  <!-- tabs-open -->

  ### Elixir

      iex> OpenTelemetry.SemConv.Incubating.SystemAttributes.system_memory_state()
      :"system.memory.state"
      
      iex> OpenTelemetry.SemConv.Incubating.SystemAttributes.system_memory_state_values().used
      :used
      
      iex> %{OpenTelemetry.SemConv.Incubating.SystemAttributes.system_memory_state() => OpenTelemetry.SemConv.Incubating.SystemAttributes.system_memory_state_values().used}
      %{:"system.memory.state" => :used}
      
      iex> OpenTelemetry.SemConv.Incubating.SystemAttributes.system_memory_state_values(:custom_value)
      :custom_value

  ### Erlang

  ```erlang
  ?SYSTEM_MEMORY_STATE.
  'system.memory.state'

  \#{?SYSTEM_MEMORY_STATE => ?SYSTEM_MEMORY_STATE_VALUES.used}.
  \#{'system.memory.state' => used}

  ?'SYSTEM_MEMORY_STATE_VALUES.used'.
  used

  ?SYSTEM_MEMORY_STATE_VALUES(custom_value).
  custom_value
  ```

  <!-- tabs-close -->
  """
  @spec system_memory_state :: :"system.memory.state"
  def system_memory_state do
    :"system.memory.state"
  end

  @spec system_memory_state_values() :: system_memory_state_values()
  def system_memory_state_values() do
    %{
      :used => :used,
      :free => :free,
      :shared => :shared,
      :buffers => :buffers,
      :cached => :cached
    }
  end

  @spec system_memory_state_values(atom() | String.t()) :: atom() | String.t()
  def system_memory_state_values(custom_value) do
    custom_value
  end

  @typedoc """
  A stateless protocol **MUST** **NOT** set this attribute

  ### Enum Values
  * `:close` ^[e](`m:OpenTelemetry.SemConv#experimental`)^
  * `:close_wait` ^[e](`m:OpenTelemetry.SemConv#experimental`)^
  * `:closing` ^[e](`m:OpenTelemetry.SemConv#experimental`)^
  * `:delete` ^[e](`m:OpenTelemetry.SemConv#experimental`)^
  * `:established` ^[e](`m:OpenTelemetry.SemConv#experimental`)^
  * `:fin_wait_1` ^[e](`m:OpenTelemetry.SemConv#experimental`)^
  * `:fin_wait_2` ^[e](`m:OpenTelemetry.SemConv#experimental`)^
  * `:last_ack` ^[e](`m:OpenTelemetry.SemConv#experimental`)^
  * `:listen` ^[e](`m:OpenTelemetry.SemConv#experimental`)^
  * `:syn_recv` ^[e](`m:OpenTelemetry.SemConv#experimental`)^
  * `:syn_sent` ^[e](`m:OpenTelemetry.SemConv#experimental`)^
  * `:time_wait` ^[e](`m:OpenTelemetry.SemConv#experimental`)^
  """
  @type system_network_state_values() :: %{
          :close => :close,
          :close_wait => :close_wait,
          :closing => :closing,
          :delete => :delete,
          :established => :established,
          :fin_wait_1 => :fin_wait_1,
          :fin_wait_2 => :fin_wait_2,
          :last_ack => :last_ack,
          :listen => :listen,
          :syn_recv => :syn_recv,
          :syn_sent => :syn_sent,
          :time_wait => :time_wait
        }
  @doc """
  A stateless protocol **MUST** **NOT** set this attribute

  ### Examples

  ```
  ["close_wait"]
  ```

  <!-- tabs-open -->

  ### Elixir

      iex> OpenTelemetry.SemConv.Incubating.SystemAttributes.system_network_state()
      :"system.network.state"
      
      iex> OpenTelemetry.SemConv.Incubating.SystemAttributes.system_network_state_values().close
      :close
      
      iex> %{OpenTelemetry.SemConv.Incubating.SystemAttributes.system_network_state() => OpenTelemetry.SemConv.Incubating.SystemAttributes.system_network_state_values().close}
      %{:"system.network.state" => :close}
      
      iex> OpenTelemetry.SemConv.Incubating.SystemAttributes.system_network_state_values(:custom_value)
      :custom_value

  ### Erlang

  ```erlang
  ?SYSTEM_NETWORK_STATE.
  'system.network.state'

  \#{?SYSTEM_NETWORK_STATE => ?SYSTEM_NETWORK_STATE_VALUES.close}.
  \#{'system.network.state' => close}

  ?'SYSTEM_NETWORK_STATE_VALUES.close'.
  close

  ?SYSTEM_NETWORK_STATE_VALUES(custom_value).
  custom_value
  ```

  <!-- tabs-close -->
  """
  @spec system_network_state :: :"system.network.state"
  def system_network_state do
    :"system.network.state"
  end

  @spec system_network_state_values() :: system_network_state_values()
  def system_network_state_values() do
    %{
      :close => :close,
      :close_wait => :close_wait,
      :closing => :closing,
      :delete => :delete,
      :established => :established,
      :fin_wait_1 => :fin_wait_1,
      :fin_wait_2 => :fin_wait_2,
      :last_ack => :last_ack,
      :listen => :listen,
      :syn_recv => :syn_recv,
      :syn_sent => :syn_sent,
      :time_wait => :time_wait
    }
  end

  @spec system_network_state_values(atom() | String.t()) :: atom() | String.t()
  def system_network_state_values(custom_value) do
    custom_value
  end

  @typedoc """
  The paging access direction

  ### Enum Values
  * `:in` ^[e](`m:OpenTelemetry.SemConv#experimental`)^
  * `:out` ^[e](`m:OpenTelemetry.SemConv#experimental`)^
  """
  @type system_paging_direction_values() :: %{
          :in => :in,
          :out => :out
        }
  @doc """
  The paging access direction

  ### Examples

  ```
  ["in"]
  ```

  <!-- tabs-open -->

  ### Elixir

      iex> OpenTelemetry.SemConv.Incubating.SystemAttributes.system_paging_direction()
      :"system.paging.direction"
      
      iex> OpenTelemetry.SemConv.Incubating.SystemAttributes.system_paging_direction_values().in
      :in
      
      iex> %{OpenTelemetry.SemConv.Incubating.SystemAttributes.system_paging_direction() => OpenTelemetry.SemConv.Incubating.SystemAttributes.system_paging_direction_values().in}
      %{:"system.paging.direction" => :in}
      
      iex> OpenTelemetry.SemConv.Incubating.SystemAttributes.system_paging_direction_values(:custom_value)
      :custom_value

  ### Erlang

  ```erlang
  ?SYSTEM_PAGING_DIRECTION.
  'system.paging.direction'

  \#{?SYSTEM_PAGING_DIRECTION => ?SYSTEM_PAGING_DIRECTION_VALUES.in}.
  \#{'system.paging.direction' => in}

  ?'SYSTEM_PAGING_DIRECTION_VALUES.in'.
  in

  ?SYSTEM_PAGING_DIRECTION_VALUES(custom_value).
  custom_value
  ```

  <!-- tabs-close -->
  """
  @spec system_paging_direction :: :"system.paging.direction"
  def system_paging_direction do
    :"system.paging.direction"
  end

  @spec system_paging_direction_values() :: system_paging_direction_values()
  def system_paging_direction_values() do
    %{
      :in => :in,
      :out => :out
    }
  end

  @spec system_paging_direction_values(atom() | String.t()) :: atom() | String.t()
  def system_paging_direction_values(custom_value) do
    custom_value
  end

  @typedoc """
  The memory paging state

  ### Enum Values
  * `:used` ^[e](`m:OpenTelemetry.SemConv#experimental`)^
  * `:free` ^[e](`m:OpenTelemetry.SemConv#experimental`)^
  """
  @type system_paging_state_values() :: %{
          :used => :used,
          :free => :free
        }
  @doc """
  The memory paging state

  ### Examples

  ```
  ["free"]
  ```

  <!-- tabs-open -->

  ### Elixir

      iex> OpenTelemetry.SemConv.Incubating.SystemAttributes.system_paging_state()
      :"system.paging.state"
      
      iex> OpenTelemetry.SemConv.Incubating.SystemAttributes.system_paging_state_values().used
      :used
      
      iex> %{OpenTelemetry.SemConv.Incubating.SystemAttributes.system_paging_state() => OpenTelemetry.SemConv.Incubating.SystemAttributes.system_paging_state_values().used}
      %{:"system.paging.state" => :used}
      
      iex> OpenTelemetry.SemConv.Incubating.SystemAttributes.system_paging_state_values(:custom_value)
      :custom_value

  ### Erlang

  ```erlang
  ?SYSTEM_PAGING_STATE.
  'system.paging.state'

  \#{?SYSTEM_PAGING_STATE => ?SYSTEM_PAGING_STATE_VALUES.used}.
  \#{'system.paging.state' => used}

  ?'SYSTEM_PAGING_STATE_VALUES.used'.
  used

  ?SYSTEM_PAGING_STATE_VALUES(custom_value).
  custom_value
  ```

  <!-- tabs-close -->
  """
  @spec system_paging_state :: :"system.paging.state"
  def system_paging_state do
    :"system.paging.state"
  end

  @spec system_paging_state_values() :: system_paging_state_values()
  def system_paging_state_values() do
    %{
      :used => :used,
      :free => :free
    }
  end

  @spec system_paging_state_values(atom() | String.t()) :: atom() | String.t()
  def system_paging_state_values(custom_value) do
    custom_value
  end

  @typedoc """
  The memory paging type

  ### Enum Values
  * `:major` ^[e](`m:OpenTelemetry.SemConv#experimental`)^
  * `:minor` ^[e](`m:OpenTelemetry.SemConv#experimental`)^
  """
  @type system_paging_type_values() :: %{
          :major => :major,
          :minor => :minor
        }
  @doc """
  The memory paging type

  ### Examples

  ```
  ["minor"]
  ```

  <!-- tabs-open -->

  ### Elixir

      iex> OpenTelemetry.SemConv.Incubating.SystemAttributes.system_paging_type()
      :"system.paging.type"
      
      iex> OpenTelemetry.SemConv.Incubating.SystemAttributes.system_paging_type_values().major
      :major
      
      iex> %{OpenTelemetry.SemConv.Incubating.SystemAttributes.system_paging_type() => OpenTelemetry.SemConv.Incubating.SystemAttributes.system_paging_type_values().major}
      %{:"system.paging.type" => :major}
      
      iex> OpenTelemetry.SemConv.Incubating.SystemAttributes.system_paging_type_values(:custom_value)
      :custom_value

  ### Erlang

  ```erlang
  ?SYSTEM_PAGING_TYPE.
  'system.paging.type'

  \#{?SYSTEM_PAGING_TYPE => ?SYSTEM_PAGING_TYPE_VALUES.major}.
  \#{'system.paging.type' => major}

  ?'SYSTEM_PAGING_TYPE_VALUES.major'.
  major

  ?SYSTEM_PAGING_TYPE_VALUES(custom_value).
  custom_value
  ```

  <!-- tabs-close -->
  """
  @spec system_paging_type :: :"system.paging.type"
  def system_paging_type do
    :"system.paging.type"
  end

  @spec system_paging_type_values() :: system_paging_type_values()
  def system_paging_type_values() do
    %{
      :major => :major,
      :minor => :minor
    }
  end

  @spec system_paging_type_values(atom() | String.t()) :: atom() | String.t()
  def system_paging_type_values(custom_value) do
    custom_value
  end

  @typedoc """
  The process state, e.g., [Linux Process State Codes](https://man7.org/linux/man-pages/man1/ps.1.html#PROCESS_STATE_CODES)


  ### Enum Values
  * `:running` ^[e](`m:OpenTelemetry.SemConv#experimental`)^
  * `:sleeping` ^[e](`m:OpenTelemetry.SemConv#experimental`)^
  * `:stopped` ^[e](`m:OpenTelemetry.SemConv#experimental`)^
  * `:defunct` ^[e](`m:OpenTelemetry.SemConv#experimental`)^
  """
  @type system_process_status_values() :: %{
          :running => :running,
          :sleeping => :sleeping,
          :stopped => :stopped,
          :defunct => :defunct
        }
  @doc """
  The process state, e.g., [Linux Process State Codes](https://man7.org/linux/man-pages/man1/ps.1.html#PROCESS_STATE_CODES)


  ### Examples

  ```
  ["running"]
  ```

  <!-- tabs-open -->

  ### Elixir

      iex> OpenTelemetry.SemConv.Incubating.SystemAttributes.system_process_status()
      :"system.process.status"
      
      iex> OpenTelemetry.SemConv.Incubating.SystemAttributes.system_process_status_values().running
      :running
      
      iex> %{OpenTelemetry.SemConv.Incubating.SystemAttributes.system_process_status() => OpenTelemetry.SemConv.Incubating.SystemAttributes.system_process_status_values().running}
      %{:"system.process.status" => :running}
      
      iex> OpenTelemetry.SemConv.Incubating.SystemAttributes.system_process_status_values(:custom_value)
      :custom_value

  ### Erlang

  ```erlang
  ?SYSTEM_PROCESS_STATUS.
  'system.process.status'

  \#{?SYSTEM_PROCESS_STATUS => ?SYSTEM_PROCESS_STATUS_VALUES.running}.
  \#{'system.process.status' => running}

  ?'SYSTEM_PROCESS_STATUS_VALUES.running'.
  running

  ?SYSTEM_PROCESS_STATUS_VALUES(custom_value).
  custom_value
  ```

  <!-- tabs-close -->
  """
  @spec system_process_status :: :"system.process.status"
  def system_process_status do
    :"system.process.status"
  end

  @spec system_process_status_values() :: system_process_status_values()
  def system_process_status_values() do
    %{
      :running => :running,
      :sleeping => :sleeping,
      :stopped => :stopped,
      :defunct => :defunct
    }
  end

  @spec system_process_status_values(atom() | String.t()) :: atom() | String.t()
  def system_process_status_values(custom_value) do
    custom_value
  end

  @typedoc """
  Deprecated, use `system.process.status` instead.

  ### Enum Values
  * `:running` ^[e](`m:OpenTelemetry.SemConv#experimental`)^
  * `:sleeping` ^[e](`m:OpenTelemetry.SemConv#experimental`)^
  * `:stopped` ^[e](`m:OpenTelemetry.SemConv#experimental`)^
  * `:defunct` ^[e](`m:OpenTelemetry.SemConv#experimental`)^
  """
  @type system_processes_status_values() :: %{
          :running => :running,
          :sleeping => :sleeping,
          :stopped => :stopped,
          :defunct => :defunct
        }
  @deprecated """
  Replaced by `system.process.status`.
  """
  @spec system_processes_status :: :"system.processes.status"
  def system_processes_status do
    :"system.processes.status"
  end

  @spec system_processes_status_values() :: system_processes_status_values()
  def system_processes_status_values() do
    %{
      :running => :running,
      :sleeping => :sleeping,
      :stopped => :stopped,
      :defunct => :defunct
    }
  end

  @spec system_processes_status_values(atom() | String.t()) :: atom() | String.t()
  def system_processes_status_values(custom_value) do
    custom_value
  end
end
