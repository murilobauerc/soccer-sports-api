defmodule SoccerSportsApi.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      # Start the PubSub system
      {Phoenix.PubSub, name: SoccerSportsApi.PubSub},
      # Start Finch
      {Finch, name: SoccerSportsApi.Finch},
      # Start the Endpoint (http/https)
      SoccerSportsApiWeb.Endpoint,
      # Start a worker by calling: SoccerSportsApi.Worker.start_link(arg)
      # {SoccerSportsApi.Worker, arg}
      #{
      #  Plug.Cowboy,
      #  scheme: :http, plug: SoccerSportsApiWeb.Endpoint, port: 8080
      #}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: SoccerSportsApi.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    SoccerSportsApiWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
