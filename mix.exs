defmodule Telldus.Mixfile do
  use Mix.Project

  def project do
    [
      app: :telldus,
      version: "0.0.1",
      elixir: "~> 1.4",
      build_embedded: Mix.env == :prod,
      start_permanent: Mix.env == :prod,
      deps: deps(),
      preferred_cli_env: ["test.watch": :test],
    ]
  end

  def application do
    [extra_applications: [:logger]]
  end

  defp deps do
    [
      {:oauth, github: "tim/erlang-oauth"},
      {:poison, "~> 2.0"},
      {:mix_test_watch, "~> 0.2", only: :test}
    ]
  end
end
