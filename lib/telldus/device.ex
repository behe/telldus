defmodule Telldus.Device do
  defstruct \
    client: nil,
    client_device_id: nil,
    client_name: nil,
    devices: nil,
    editable: nil,
    id: nil,
    ignored: nil,
    methods: nil,
    name: nil,
    online: nil,
    state: nil,
    statevalue: nil,
    type: nil

  def parse(map) do
    %__MODULE__{
      client: map["client"],
      client_device_id: map["clientDeviceId"],
      client_name: map["clientName"],
      devices: map["devices"],
      editable: map["editable"] == 1,
      id: map["id"],
      ignored: map["ignored"] == 1,
      methods: map["methods"],
      name: map["name"],
      online: map["online"],
      state: map["state"],
      statevalue: map["statevalue"],
      type: String.to_atom(map["type"]),
    }
  end

  def find(device_id, devices) do
    Enum.find(devices, &(&1.id == device_id))
  end
end
