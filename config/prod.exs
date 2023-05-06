import Config

# Do not print debug messages in production
config :logger, level: :info


config :soccer_sports_api, SoccerSportsApiWeb.Endpoint,
  force_ssl: [rewrite_on: [:x_forwarded_proto]],
  http: [:inet6, port: System.get_env("PORT") || 4000],
  url: [host: System.get_env("APP_NAME") <> ".gigalixirapp.com", port: 443],
  secret_key_base: Map.fetch!(System.get_env(), "SECRET_KEY_BASE"),
  cache_static_manifest: "priv/static/cache_manifest.json",
  server: true
