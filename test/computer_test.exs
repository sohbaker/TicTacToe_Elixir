defmodule ComputerTest do
  use ExUnit.Case
  doctest Computer

  test "has a mark" do
    computer = Computer.new()

    assert Computer.get_mark(computer) == "O"
  end

  test "selects a random move" do
    computer = Computer.new()
    board = Board.grid()

    assert Computer.get_move(computer, board) in Board.available_moves(board)
  end
end
