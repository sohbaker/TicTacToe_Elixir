defmodule BoardTest do
  use ExUnit.Case
  doctest Board

  test "has a grid" do
    assert Enum.member?(Board.grid(), "1") == true
    assert length(Board.grid()) == 9
  end

  test "marks the grid" do
    board = Board.grid()
    assert Enum.member?(Board.mark_board(board, 1, "X"), "X") == true
  end

  test "knows the available moves" do
    board = Board.grid()
    updated_board = Board.mark_board(board, 1, "X")
    mark_one = "X"
    mark_two = "O"

    assert length(Board.available_moves(updated_board, [mark_one, mark_two])) ==
             length(Board.grid()) - 1
  end

  test "knows when a move is valid" do
    board = Board.grid()
    position = 1
    mark_one = "X"
    mark_two = "O"
    assert Board.valid?(board, position, [mark_one, mark_two]) == true
  end

  test "knows when a move is invalid" do
    board = Board.grid()
    position = 1
    mark_one = "X"
    mark_two = "O"
    updated_board = Board.mark_board(board, position, mark_one)
    assert Board.valid?(updated_board, position, [mark_one, mark_two]) == false
  end

  test "knows when the board is full" do
    board = Board.grid()
    mark_one = "X"
    mark_two = "O"
    board = Board.mark_board(board, 1, mark_one)
    board = Board.mark_board(board, 3, mark_two)
    board = Board.mark_board(board, 2, mark_one)
    board = Board.mark_board(board, 4, mark_two)
    board = Board.mark_board(board, 5, mark_one)
    board = Board.mark_board(board, 8, mark_two)
    board = Board.mark_board(board, 6, mark_one)
    board = Board.mark_board(board, 9, mark_two)
    board = Board.mark_board(board, 7, mark_one)
    assert Board.full?(board, [mark_one, mark_two]) == true
  end

  test "knows the game can continue as the board is not full" do
    board = Board.grid()
    mark_one = "X"
    mark_two = "O"
    board = Board.mark_board(board, 1, mark_one)
    board = Board.mark_board(board, 3, mark_two)
    board = Board.mark_board(board, 6, mark_one)
    board = Board.mark_board(board, 8, mark_two)
    assert Board.full?(board, [mark_one, mark_two]) == false
  end

  test "knows the when player with mark 'x' has won the game" do
    board = Board.grid()
    mark_one = "X"
    mark_two = "O"
    board = Board.mark_board(board, 1, mark_one)
    board = Board.mark_board(board, 2, mark_two)
    board = Board.mark_board(board, 4, mark_one)
    board = Board.mark_board(board, 5, mark_two)
    board = Board.mark_board(board, 7, mark_one)
    winner = Board.win?(board, [mark_one, mark_two])
    assert Enum.at(winner, 0)  == true
  end

  test "knows the when player with mark 'o' has won the game" do
    board = Board.grid()
    mark_one = "O"
    mark_two = "X"
    board = Board.mark_board(board, 1, mark_one)
    board = Board.mark_board(board, 4, mark_two)
    board = Board.mark_board(board, 2, mark_one)
    board = Board.mark_board(board, 7, mark_two)
    board = Board.mark_board(board, 3, mark_one)
    winner = Board.win?(board, [mark_one, mark_two])
    assert Enum.at(winner, 0)  == true
  end

  test "knows when the game has ended with a tie" do
    board = Board.grid()
    mark_one = "X"
    mark_two = "O"
    board = Board.mark_board(board, 1, mark_one)
    board = Board.mark_board(board, 3, mark_two)
    board = Board.mark_board(board, 2, mark_one)
    board = Board.mark_board(board, 4, mark_two)
    board = Board.mark_board(board, 5, mark_one)
    board = Board.mark_board(board, 8, mark_two)
    board = Board.mark_board(board, 6, mark_one)
    board = Board.mark_board(board, 9, mark_two)
    board = Board.mark_board(board, 7, mark_one)
    assert Board.tie?(board, [mark_one, mark_two]) == true
  end
end
