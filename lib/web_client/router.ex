defmodule Web_Client.Router do
  use Plug.Router
  alias Web_Client.API

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

  match _ do
    send_resp(conn, 404, "Page Missing")
  end
end
