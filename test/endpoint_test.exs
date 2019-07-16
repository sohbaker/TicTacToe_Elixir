defmodule TicTacToe.EndpointTest do
  use Exunit.Case, async: true
  use Plug.Test

  @opts TicTacToe.Endpoint.init([])

  test "it returns pong" do
    conn = conn(:get, "/ping")

    assert conn.state == :sent
    assert conn.status == 200
    assert conn.resp_boady == "pong!"
  end
end
