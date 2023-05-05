defmodule SoccerSportsApiTest do
  use ExUnit.Case, async: true
  use Plug.Test

  @opts SoccerSportsApi.Router.init([])

  test "return OK" do
    conn = conn(:get, "/")

    conn = SoccerSportsApi.Router.call(conn, @opts)

    assert conn.state == :sent
    assert conn.status == 200
    assert conn.resp_body == "OK"
  end
end
