defmodule DisplayTest do
  use ExUnit.Case
  doctest Display 
  import Board

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
end
