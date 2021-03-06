defmodule An.Mixfile do
  use Mix.Project

  def project do
    [app: :an,
     version: "0.0.1",
     elixir: "~> 1.2",
     elixirc_paths: elixirc_paths(Mix.env),
     compilers: [:phoenix, :gettext] ++ Mix.compilers,
     build_embedded: Mix.env == :prod,
     start_permanent: Mix.env == :prod,
     aliases: aliases(),
     deps: deps()]
  end

  # Configuration for the OTP application.
  #
  # Type `mix help compile.app` for more information.
  def application do
    [mod: {An, []},
     applications: [:phoenix, :phoenix_pubsub,:phoenix_ecto, :postgrex, :phoenix_html,
                    :gettext, :cowboy, :logger,:httpoison, :timex, :redix, :floki, :joken, :corsica,
                    :sentry]]
  end

  # Specifies which paths to compile per environment.
  defp elixirc_paths(:test), do: ["lib", "web", "test/support"]
  defp elixirc_paths(_),     do: ["lib", "web"]

  # Specifies your project dependencies.
  #
  # Type `mix help deps` for examples and options.
  defp deps do
    [{:phoenix, "~> 1.2.0"},
     {:phoenix_pubsub, "~> 1.0"},
     {:phoenix_ecto, "~> 3.0"},
     {:ecto, "~> 2.1.1", override: true},
     {:postgrex, "~> 0.13.0"},
     {:phoenix_html, "~> 2.6"},
     {:phoenix_live_reload, "~> 1.0", only: :dev},
     {:gettext, "~> 0.11"},
     {:cowboy, "~> 1.0"},
     {:poison, "~> 2.0"},
     {:httpoison, "~> 0.11.0"},
     {:redix, "~> 0.5.0"},
     {:timex, "~> 3.0"},
     {:csv, "~> 1.4.2"},
     {:floki, "~> 0.12.0"},
     {:joken, "~> 1.3"},
     {:corsica, "~> 0.4"},
     {:sentry, "~> 2.0"},
     {:dialyxir, "~> 0.4.0", only: [:dev]},
     {:credo, "~> 0.4", only: [:dev, :test]}]
  end

  # Aliases are shortcuts or tasks specific to the current project.
  # For example, to create, migrate and run the seeds file at once:
  #
  #     $ mix ecto.setup
  #
  # See the documentation for `Mix` for more info on aliases.
  defp aliases do
    ["ecto.setup": ["ecto.create", "ecto.migrate", "run priv/repo/seeds.exs"],
     "ecto.reset": ["ecto.drop", "ecto.setup"],
     "test": ["ecto.create --quiet", "ecto.migrate", "test"]]
  end
end
