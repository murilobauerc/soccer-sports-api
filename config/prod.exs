import Config

# Do not print debug messages in production
config :logger, level: :info


config :soccer_sports_api, SoccerSportsApiWeb.Endpoint,
  http: [String.to_integer(System.get_env("PORT") || "4000")], # Possibly not needed, but doesn't hurt
  url: [host: System.get_env("APP_NAME") <> ".gigalixirapp.com", port: 443],
  secret_key_base: Map.fetch!(System.get_env(), "SECRET_KEY_BASE"),
  server: true
