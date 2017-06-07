defmodule Telldus do
  def schedule do
    %{"job" => jobs} = Telldus.Request.get("/scheduler/jobList")
    jobs |> Enum.map(&Telldus.Job.parse/1)
  end

  def devices do
    %{"device" => devices} = Telldus.Request.get("/devices/list", %{supportedMethods: 1})
    devices |> Enum.map(&Telldus.Device.parse/1)
  end

  def sensors do
    %{"sensor" => sensors} = Telldus.Request.get("/sensors/list")
    sensors |> Enum.map(&Telldus.Sensor.parse/1)
  end

  def info(%{id: sensor_id}), do: info(sensor_id)
  def info(sensor_id) do
    Telldus.Request.get("/sensor/info", %{id: sensor_id})
  end

  def dim(%{id: device_id}, level), do: dim(device_id, level)
  def dim(device_id, level) do
    Telldus.Request.post("/device/dim", %{id: device_id, level: level})
  end

  def on(%{id: device_id}), do: on(device_id)
  def on(device_id) do
    Telldus.Request.post("/device/turnOn", %{id: device_id})
  end

  def off(%{id: device_id}), do: off(device_id)
  def off(device_id) do
    Telldus.Request.post("/device/turnOff", %{id: device_id})
  end

  def enable(%Telldus.Job{id: job_id}), do: enable(job_id)
  def enable(job_id) do
    Telldus.Request.post("/scheduler/setJob", %{id: job_id, active: "1"})
  end

  def disable(%Telldus.Job{id: job_id}), do: disable(job_id)
  def disable(job_id) do
    Telldus.Request.post("/scheduler/setJob", %{id: job_id, active: "0"})
  end
end
