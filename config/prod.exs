import Config

# Do not print debug messages in production
config :logger, level: :info


config :soccer_sports_api, SoccerSportsApiWeb.Endpoint,
  url: [host: System.get_env("APP_NAME") <> ".gigalixirapp.com", port: 443],
  http: [
      # Enable IPv6 and bind on all interfaces.
      # Set it to  {0, 0, 0, 0, 0, 0, 0, 1} for local network only access.
      # See the documentation on https://hexdocs.pm/plug_cowboy/Plug.Cowboy.html
      # for details about using IPv6 vs IPv4 and loopback vs public addresses.
      ip: {0, 0, 0, 0, 0, 0, 0, 0},
      port: String.to_integer(System.get_env("PORT") || "4000")
    ]
