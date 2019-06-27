defmodule DisplayTest do
  use ExUnit.Case
  doctest Display 

  test "prints a greeting" do
    assert Display.greeting() == "Welcome to Tic Tac Toe!"
  end
end
