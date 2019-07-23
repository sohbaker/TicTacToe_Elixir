defmodule WebClient.Router do
  use Plug.Router
  alias WebClient.API

  plug Plug.Logger, log: :debug

  plug :match
  plug Plug.Parsers,
    parsers: [:json],
    pass: ["application/json"],
    json_decoder: Poison
  plug :dispatch

  get "/" do
    API.Endpoint.show_welcome(conn)
  end

  get "/play" do
    API.Endpoint.show_game(conn)
  end

  post "/hello" do
    conn
    |> put_resp_content_type("application/json")
    |> send_resp(200, inspect conn)
  end

  match _ do
    send_resp(conn, 404, "Page Missing")
  end
end
