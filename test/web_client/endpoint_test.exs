defmodule WebClient.EndpointTest do
  use ExUnit.Case, async: true
  use Plug.Test

  @opts WebClient.Endpoint.init([])

  test "it returns tictactoe" do
    conn = conn(:get, "/play")

    conn = WebClient.Endpoint.call(conn, @opts)

    assert conn.state == :sent
    assert conn.status == 200
    assert conn.resp_body == "tictactoe!"
  end

  test "it returns 200 with a valid payload" do
    conn = conn(:post, "/game", %{events: [%{}]})

    conn = WebClient.Endpoint.call(conn, @opts)

    assert conn.status == 200
  end

  test "it returns 422 with an invalid payload" do
    conn = conn(:post, "/game", %{})

    conn = WebClient.Endpoint.call(conn, @opts)

    assert conn.status == 422
  end

  test "it returns 404 when no route matches" do
    conn = conn(:get, "/fail")

    conn = WebClient.Endpoint.call(conn, @opts)

    assert conn.status == 404
  end
end
