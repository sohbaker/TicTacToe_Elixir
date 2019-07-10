defmodule ComputerTest do
  use ExUnit.Case
  doctest Computer

  test "has a mark" do
    computer = Computer.new("O")
    assert Computer.get_mark(computer) == "O"
  end
end
