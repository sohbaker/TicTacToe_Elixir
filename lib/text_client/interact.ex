defmodule Interact do
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
end

