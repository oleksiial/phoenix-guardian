# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :my_test_app,
  ecto_repos: [MyTestApp.Repo]

# Configures the endpoint
config :my_test_app, MyTestAppWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "CDKg0YBXehcVNI4snB37GwyaYSF1CT5v1xEXhuqkJ7HOLFqXwa+zr9A2ED/g5I3G",
  render_errors: [view: MyTestAppWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: MyTestApp.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
