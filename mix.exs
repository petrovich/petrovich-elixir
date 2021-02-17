defmodule Petrovich.Mixfile do
  use Mix.Project

  @version "1.0.0"
  @url "https://github.com/petrovich/petrovich_elixir"

  def project do
    [
      app: :petrovich_elixir,
      version: @version,
      elixir: "~> 1.6",
      build_embedded: Mix.env() == :prod,
      start_permanent: Mix.env() == :prod,
      deps: deps(),

      # Hex:
      docs: docs(),
      description: description(),
      package: package(),
      source_url: @url,
      homepage_url: @url,

      # Test coverage:
      test_coverage: [tool: ExCoveralls],
      preferred_cli_env: [
        coveralls: :test,
        "coveralls.detail": :test,
        "coveralls.post": :test,
        "coveralls.html": :test
      ],

      # Dialyzer:
      dialyzer: [
        plt_add_deps: :apps_direct,
        plt_core_path: "priv/plts",
        plt_file: {:no_warn, "priv/plts/dialyzer.plt"}
      ]
    ]
  end

  def application do
    # Specify extra applications you'll use from Erlang/Elixir
    [mod: {Petrovich, []}, extra_applications: [:logger]]
  end

  defp deps do
    [
      {:jason, "~> 1.1"},

      # Dev and test dependencies:
      {:credo, "~> 1.5", only: [:dev, :test], runtime: false},
      {:excoveralls, "~> 0.11", only: :test, runtime: false},
      {:dialyxir, "~> 1.0", only: [:dev, :test], runtime: false},
      {:ex_doc, "~> 0.20", only: :dev}
    ]
  end

  defp description do
    "Elixir library to inflect Russian first, last, and middle names."
  end

  defp docs do
    [extras: ["README.md"], main: "readme"]
  end

  defp package do
    [
      maintainers: ["Nikita Sobolev"],
      licenses: ["MIT"],
      links: %{"GitHub" => @url},
      files: ~w(mix.exs README.md lib config rules/*.json)
    ]
  end
end
