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
      Interact.show_outcome(game.board)
    else
      Interact.get_new_move(game.current_player, game.board)
      |> take_turn(game)
      |> play()
    end
  end

  def take_turn(move, game) do
    update_board(move, game)
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
    Board.tie?(board) || Board.win?(board)
  end
end
