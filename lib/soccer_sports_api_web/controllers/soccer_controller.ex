defmodule SoccerSportsApiWeb.SoccerController do
  require Logger

  use SoccerSportsApiWeb, :controller

  alias SoccerSportsApi.Services.SoccerService

  def index(conn, _params) do
    Logger.info("SoccerSportsApiWeb.SoccerController.index/2")

    case SoccerService.search() do
      {:ok, data} ->
        conn
        |> put_status(:ok)
        |> json(data)

      _ ->
        conn
        |> put_status(:internal_server_error)
        |> json(%{error: "Internal Server Error"})
    end
  end
end