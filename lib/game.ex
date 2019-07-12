defmodule Game do
  defstruct [:board, :current_player, :other_player]

  def new(player_x, player_o) do
    %Game{
      board: Board.grid(),
      current_player: player_x,
      other_player: player_o,
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
    |> update_board(game)
    |> toggle_players()
  end

  defp update_board(move, %Game{board: board, current_player: current} = game) do
    new_board = Board.mark_board(board, move, current.mark)
    %Game{game | board: new_board}
  end

  defp toggle_players(%Game{current_player: current, other_player: other} = game) do
    %Game{game | current_player: other, other_player: current}
  end

  defp over?(board) do
    Board.tie?(board) || Enum.at(Board.win?(board), 0)
  end

  defp show_outcome(board) do
    [win, mark] = Board.win?(board)
    if win == true do
      Display.show_board(board)
      Display.announce_win(mark) 
      |> Display.print_to_screen
    else
      Display.show_board(board)
      Display.announce_tie 
      |> Display.print_to_screen
    end
  end
end
