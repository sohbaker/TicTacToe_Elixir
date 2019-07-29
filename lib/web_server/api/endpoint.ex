defmodule WebClient.API.Endpoint do
  import Plug.Conn

  def show_welcome(conn) do
    send_resp(conn, 200, "Welcome to Tic Tac Toe!")
  end

  def show_game(conn) do
    conn
    |> put_resp_content_type("application/json")
    |> send_resp(200, Poison.encode!(%{game: game()}))
  end

  defp game do
    %Game{
      current_player: %Human{},
      other_player: %Computer{},
      board: Board.grid()
    }
  end
end
