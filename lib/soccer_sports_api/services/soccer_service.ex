defmodule SoccerSportsApi.Services.SoccerService do
  use Tesla

  import Utils.Helper, only: [atomize_keys: 1]

  plug(
    Tesla.Middleware.BaseUrl,
    "http://site.api.espn.com"
  )

  plug(Tesla.Middleware.Headers, [{"Accept", "application/json"}])

  plug(Tesla.Middleware.JSON)

  def search() do
    case get("/apis/site/v2/sports/soccer/bra.1/scoreboard") do
      {:ok, %Tesla.Env{body: body}} ->
        {:ok, atomize_keys(body)}

      _ ->
        {:error, "Internal Server Error"}
    end
  end
end
