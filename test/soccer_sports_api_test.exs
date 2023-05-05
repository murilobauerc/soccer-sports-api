defmodule SoccerSportsApiTest do
  use ExUnit.Case
  doctest SoccerSportsApi

  test "greets the world" do
    assert SoccerSportsApi.hello() == :world
  end
end
