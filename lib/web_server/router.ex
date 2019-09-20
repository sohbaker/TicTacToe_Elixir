defmodule WebServer.Router do
  use Plug.Router
  # alias WebClient.API

  plug Plug.Logger, log: :debug
  plug :match
  plug Plug.Parsers,
    parsers: [:json],
    pass: ["application/json"],
    json_decoder: Poison
  plug :dispatch

  get "/" do
    send_resp(conn, 200, "Welcome to Tic Tac Toe!")
  end

  get "/play" do
    conn
    |> put_resp_content_type("application/json")
    |> send_resp(200, Poison.encode!(%{game: new_game()}))
  end

  post "/play" do
    {status, body} =
      case conn.params do
        %{"move" => move, "game" => game} -> {200, add_move(move, game)}
        _ -> {422, missing_data()}
      end

    send_resp(conn, status, body)
    # %{"game" => conn.resp_body["game"]}
  end

  defp new_game do
    GameLoader.human_human()
  end

  defp add_move(move, game) do
    game = %Game{
      board: game["board"],
      current_player: %{
        mark: game["current_player"]["mark"]
      },
      other_player: %{
        mark: game["other_player"]["mark"]
      }
    }
    validate_move(String.to_integer(move), game)
  end

  defp validate_move(move, game) do
    if Board.valid?(game.board, move) && !Board.over?(game.board) do
      updated_game = Game.take_turn(move, game)
      Poison.encode!(%{game: updated_game})
    else
      Poison.encode!(%{game: game})
    end
  end

  defp missing_data() do
    Poison.encode!(%{response: "Missing move data"})
  end

  match _ do
    send_resp(conn, 404, "Invalid URL")
  end
end
