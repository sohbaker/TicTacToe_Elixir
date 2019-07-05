defmodule HumanTest do
  use ExUnit.Case
  doctest Human
  import ExUnit.CaptureIO

  test "has a mark" do
    human = Human.new("O")
    assert Human.get_mark(human) == "O"
  end

  test "selects a move" do
    human = Human.new()

    capture_io("2", fn ->
      assert Human.get_move(human) == 2
    end)
  end
end
