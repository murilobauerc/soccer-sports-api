defmodule SoccerSportsApi.Services.SoccerService do
  use Tesla

  require Logger

  plug(
    Tesla.Middleware.BaseUrl,
    "http://site.api.espn.com"
  )

  plug(Tesla.Middleware.Headers, [{"Accept", "application/json"}])

  plug(Tesla.Middleware.JSON)

  def search() do
    case get("/apis/site/v2/sports/soccer/bra.1/scoreboard") do
      {:ok, %Tesla.Env{body: body}} ->
        Logger.info("Searching on scoreboard...")

        {:ok,
         body
         |> Map.get("events")
         |> Enum.filter(fn event ->
           String.contains?(event["shortName"], "SAN")
         end)
         |> IO.inspect()}

      _ ->
        {:error, "Internal Server Error"}
    end
  end
end
