defmodule SoccerSportsApi.Repo do
  use Ecto.Repo,
    otp_app: :soccer_sports_api,
    adapter: Ecto.Adapters.Postgres
end
