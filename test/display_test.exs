defmodule DisplayTest do
  use ExUnit.Case
  doctest Display 
  import ExUnit.CaptureIO

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
    IO.puts(Display.show_board(grid))
    assert Display.show_board(grid) == """
1 | 2 | 3
---------
4 | 5 | 6
---------
7 | 8 | 9
"""
  end

  test "announces a winner" do 
    assert Display.announce_win("X") == "Player X wins!"
  end

  test "announces a tie" do 
    assert Display.announce_tie == "It's a tie!"
  end

  test "takes an input from a user" do 
    prompt = "Make a move: X\n "
    assert capture_io("1", fn ->
      IO.write Display.get_input(prompt) 
    end) == "Make a move: X\n 1"
  end
end
