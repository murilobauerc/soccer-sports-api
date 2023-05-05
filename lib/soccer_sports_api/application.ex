defmodule SoccerSportsApi.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      {Plug.Cowboy, scheme: :http, plug: SoccerSportsApi.Router, options: [port: 8080]}
    ]

    opts = [strategy: :one_for_one, name: SoccerSportsApi.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
