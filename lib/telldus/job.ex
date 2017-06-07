defmodule Telldus.Job do
  defstruct \
    id: nil,
    device_id: nil,
    active: false,
    method: nil,
    method_value: nil,
    type: nil,
    hour: nil,
    minute: nil,
    offset: 0,
    random_interval: 0,
    weekdays: nil,
    next_run_time: nil,
    repetitions: 0,
    retries: 0,
    retry_interval: 0

  def parse(map) do
    %__MODULE__{
      active: map["active"] == 1,
      device_id: map["deviceId"],
      hour: map["hour"] |> String.to_integer,
      id: map["id"],
      method: map["method"], # 1=on, 2=off, 16=dim
      method_value: map["methodValue"],
      minute: map["minute"] |> String.to_integer,
      next_run_time: map["nextRunTime"],
      offset: map["offset"],
      random_interval: map["randomInterval"],
      repetitions: map["reps"],
      retries: map["retries"],
      retry_interval: map["retryInterval"],
      type: String.to_atom(map["type"]),
      weekdays: map["weekdays"],
    }
  end
end
