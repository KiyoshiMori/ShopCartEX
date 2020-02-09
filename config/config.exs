# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :cart_api,
  ecto_repos: [CartApi.Repo]

# Configures the endpoint
config :cart_api, CartApiWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "xC2/kyMOo6jNEHWMvUfHO2lzDK9P2BnbtQEC9fySiY1nkwtUqK7qh3cpDPYFV7du",
  render_errors: [view: CartApiWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: CartApi.PubSub, adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
