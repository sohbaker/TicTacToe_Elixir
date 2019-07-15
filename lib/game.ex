defmodule Game do
  defstruct [:board, :current_player, :other_player]

  def new(player_x, player_o) do
    %Game{
      board: Board.grid(),
      current_player: player_x,
      other_player: player_o
    }
  end

  def play(game) do
    if over?(game.board) do
      show_outcome(game.board)
    else
      take_turn(game)
      |> play()
    end
  end

  defp take_turn(%Game{board: board, current_player: current} = game) do
    Display.show_board(board)

    Player.get_move(current, board)
    |> validate_move(current, board)
    |> update_board(game)
    |> toggle_players()
  end

  defp validate_move(move, current, board) do
    if Board.valid?(board, move) do
      move
    else
      Display.notify_invalid()
      |> Display.print_to_screen()
      get_new_move(current, board)
    end
  end

  defp get_new_move(current, board) do
    Player.get_move(current, board)
    |> validate_move(current, board)
  end

  defp update_board(move, %Game{board: board, current_player: current} = game) do
    new_board = Board.mark_board(board, move, current.mark)
    %Game{game | board: new_board}
  end

  defp toggle_players(%Game{current_player: current, other_player: other} = game) do
    %Game{game | current_player: other, other_player: current}
  end

  defp over?(board) do
    Board.tie?(board) || Board.win?(board)
  end

  defp show_outcome(board) do
    Display.show_board(board)
    cond do
      Board.win?(board) ->
        Board.get_winning_mark(board)
        |> Display.announce_win()
        |> Display.print_to_screen()
      Board.tie?(board) ->
        Display.announce_tie()
        |> Display.print_to_screen()
    end
  end
end
