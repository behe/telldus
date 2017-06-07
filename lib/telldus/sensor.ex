defmodule Telldus.Sensor do
  defstruct id: nil

  def parse(map) do
    %__MODULE__{
      id: map["id"],
    }
  end
end
