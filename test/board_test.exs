defmodule BoardTest do
  use ExUnit.Case
  doctest Board

  test "has a grid" do
    assert Enum.member?(Board.grid(), 1) == true
    assert length(Board.grid()) == 9
  end

  test "marks the grid" do
    board = Board.grid()

    assert Enum.member?(Board.mark_board(board, 1, "X"), "X") == true
  end

  test "knows the available moves" do
    board =
      Board.grid()
      |> Board.mark_board(1, "X")

    assert length(Board.available_moves(board)) ==
             length(Board.grid()) - 1
  end

  test "knows that a move is valid" do
    board = Board.grid()
    position = 1

    assert Board.valid?(board, position) == true
  end

  test "knows that a move is invalid because the position is taken" do
    position = 1

    board =
      Board.grid()
      |> Board.mark_board(position, "X")

    assert Board.valid?(board, position) == false
  end

  test "knows that a move is invalid because the position number does not exist" do
    position = 10
    board = Board.grid()

    assert Board.valid?(board, position) == false
  end

  test "knows that the board is full" do
    mark_one = "X"
    mark_two = "O"

    board =
      Board.grid()
      |> Board.mark_board(1, mark_one)
      |> Board.mark_board(3, mark_two)
      |> Board.mark_board(2, mark_one)
      |> Board.mark_board(4, mark_two)
      |> Board.mark_board(5, mark_one)
      |> Board.mark_board(8, mark_two)
      |> Board.mark_board(6, mark_one)
      |> Board.mark_board(9, mark_two)
      |> Board.mark_board(7, mark_one)

    assert Board.full?(board) == true
  end

  test "knows that the board is not full" do
    mark_one = "X"
    mark_two = "O"

    board =
      Board.grid()
      |> Board.mark_board(1, mark_one)
      |> Board.mark_board(3, mark_two)
      |> Board.mark_board(6, mark_one)
      |> Board.mark_board(8, mark_two)

    assert Board.full?(board) == false
  end

  test "knows that the player with mark 'x' has won the game" do
    mark_one = "X"
    mark_two = "O"

    board =
      Board.grid()
      |> Board.mark_board(1, mark_one)
      |> Board.mark_board(2, mark_two)
      |> Board.mark_board(4, mark_one)
      |> Board.mark_board(5, mark_two)
      |> Board.mark_board(7, mark_one)

    assert Board.get_winning_mark(board) == "X"
  end

  test "knows that the player with mark 'o' has won the game" do
    mark_one = "O"
    mark_two = "X"

    board =
      Board.grid()
      |> Board.mark_board(1, mark_one)
      |> Board.mark_board(4, mark_two)
      |> Board.mark_board(2, mark_one)
      |> Board.mark_board(7, mark_two)
      |> Board.mark_board(3, mark_one)

    assert Board.get_winning_mark(board) == "O"
  end

  test "knows that the game has ended with a tie" do
    mark_one = "X"
    mark_two = "O"

    board =
      Board.grid()
      |> Board.mark_board(1, mark_one)
      |> Board.mark_board(3, mark_two)
      |> Board.mark_board(2, mark_one)
      |> Board.mark_board(4, mark_two)
      |> Board.mark_board(5, mark_one)
      |> Board.mark_board(8, mark_two)
      |> Board.mark_board(6, mark_one)
      |> Board.mark_board(9, mark_two)
      |> Board.mark_board(7, mark_one)

    assert Board.tie?(board) == true
  end
end
