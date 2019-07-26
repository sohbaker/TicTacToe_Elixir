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

  post "/play" do
    {status, body} =
      case conn.params do
        %{"game" => game, "move" => move} -> {200, update_game(game, move)}
        _ -> {422, missing_data()}
      end

    send_resp(conn, status, body)
  end

  defp update_game(game, move) do
    game = %Game{
      board: game["board"],
      current_player: %{
        mark: game["current_player"]["mark"]
      },
      other_player: %{
        mark: game["other_player"]["mark"]
      }
    }
    updated = Game.take_turn(String.to_integer(move), game)
    Poison.encode!(%{game: updated})
  end

  defp missing_data() do
    Poison.encode!(%{response: "missing data"})
  end

  match _ do
    send_resp(conn, 404, "Page Missing")
  end
end
