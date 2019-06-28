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
end
