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

        map = %{}

        {:ok,
         body
         |> check_suarez_scored_last_matches("125088")
         |> put_team_suarez_score_against(map)
         |> put_last_suarez_goal_timestamp()}

      _ ->
        {:error, "Internal Server Error"}
    end
  end

  defp check_suarez_scored_last_matches(body, playerId) do
    body
    |> Map.get("events")
    |> Enum.map(fn event ->
      event["competitions"]
      |> Enum.map(fn competition ->
        competition["competitors"]
        |> Enum.map(fn competitor ->
          competitor["leaders"]
          |> Enum.map(fn leader ->
            leader["leaders"]
            |> Enum.map(fn inner_leader ->
              inner_leader["athlete"]["id"]
            end)
          end)
        end)
      end)
    end)
    |> List.flatten()
    |> Enum.uniq()
    |> Enum.filter(fn id ->
      id == playerId
    end)
  end

  defp put_team_suarez_score_against([], map) do
    Map.put(map, :teamSuarezScoredAgainst, "nil")
  end

  defp put_last_suarez_goal_timestamp(map) do
    Map.put(map, :lastSuarezGoalTimestamp, "nil")
  end
end
