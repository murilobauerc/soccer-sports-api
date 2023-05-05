import Config

config :soccer_sports_api, SoccerSportsApiWeb.Endpoint,
  cache_static_manifest: "priv/static/cache_manifest.json"

# Configures Swoosh API Client
config :swoosh, api_client: Swoosh.ApiClient.Finch, finch_name: SoccerSportsApi.Finch

# Do not print debug messages in production
config :logger, level: :info
