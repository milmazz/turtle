defmodule Turtle.Mixfile do
  use Mix.Project

  @version "0.1.0-dev"

  def project do
    [
      app: :turtle,
      version: @version,
      elixir: "~> 1.9",
      start_permanent: Mix.env() == :prod,
      deps: deps(),
      dialyzer: dialyzer()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger]
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:credo, "~> 1.6", only: [:dev, :test], runtime: false},
      {:dialyxir, "~> 1.1", only: [:dev], runtime: false},
      {:ex_doc, "~> 0.28", only: :dev, runtime: false}
    ]
  end

  defp dialyzer do
    [
      check_plt: true,
      plt_add_deps: :transitive
    ]
  end
end
