defmodule DisplayTest do
  use ExUnit.Case
  doctest Display 

  test "prints a greeting" do
    assert Display.greeting() == "Welcome to Tic Tac Toe!"
  end

  test "prompts a player to make a move" do
    mark = "X"
    assert Display.prompt_player(mark) == "Make a move: X" 
  end

  test "notifies a player of an invalid move" do 
    assert Display.notify_invalid() == "Invalid move. Please try again"
  end

  test "shows the board" do
    grid = Board.grid()
    assert Display.show_board(grid) == """
1 | 2 | 3
---------
4 | 5 | 6
---------
7 | 8 | 9
"""
  end
end
