defmodule Interact do
  def play(game) do
    if Board.over?(game.board) do
      show_outcome(game.board)
    else
      get_new_move(game.current_player, game.board)
      |> Game.take_turn(game)
      |> play()
    end
  end

  def get_new_move(current_player, board) do
    Display.show_board(board)
    Player.get_move(current_player, board)
    |> validate_move(current_player, board)
 end

  def validate_move(move, current_player, board) do
    if Board.valid?(board, move) do
      move
    else
      Display.notify_invalid()
      |> Display.print_to_screen()
      get_new_move(current_player, board)
    end
  end

  def show_outcome(board) do
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

