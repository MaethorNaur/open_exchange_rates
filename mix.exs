defmodule OpenExchangeRates.Mixfile do
  use Mix.Project

  def project do
    [
      app: :open_exchange_rates,
      description: "A library that can convert currencies and uses automatic updating of the currrency rates using openexchangerates.org",
      package: package,
      version: "0.1.0",
      elixir: "~> 1.3",
      build_embedded: Mix.env == :prod,
      start_permanent: Mix.env == :prod,
      deps: deps(),
      docs: [extras: ["README.md"]],
      preferred_cli_env: ["coveralls": :test, "coveralls.detail": :test, "coveralls.post": :test, "coveralls.html": :test],
      test_coverage: [tool: ExCoveralls]
    ]
  end

  def application do
    [
      mod: {OpenExchangeRates, []},
      applications: [:logger, :httpoison]
    ]
  end

  defp deps do
    [
      {:httpoison, ">0.0.0"},
      {:poison, ">0.0.0"},
      {:exvcr, ">0.0.0"},
      {:credo, ">0.0.0", only: [:dev, :test]},
      {:mix_test_watch, ">0.0.0", only: [:dev, :test]},
      {:ex_doc, ">0.0.0", only: [:dev, :test]},
      {:excoveralls, "~> 0.5", only: :test},
    ]
  end

  defp package do
    [
      maintainers: ["Gerard de Brieder"],
      licenses: ["MIT"],
      files: ["lib", "priv", "mix.exs", "README*", "LICENSE*", "CHANGELOG*"],
      links: %{
        "GitHub" => "https://github.com/smeevil/open_exchange_rates",
        "Docs"   => "https://smeevil.github.com/open_exchange_rates"
      }
    ]
  end
end
