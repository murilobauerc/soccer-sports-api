defmodule SoccerSportsApiWeb.Router do
  use SoccerSportsApiWeb, :router

  pipeline :browser do
    plug(:accepts, ["html"])
    plug(:fetch_session)
    plug(:protect_from_forgery)
    plug(:put_secure_browser_headers)
  end

  pipeline :api do
    plug(:accepts, ["json"])
  end

  scope "/api/v1/", SoccerSportsApiWeb do
    pipe_through(:api)

    get("/scoreboard", SoccerController, :search)
  end
end
