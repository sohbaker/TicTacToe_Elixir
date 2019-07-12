defmodule HumanTest do
  use ExUnit.Case
  doctest Human
  import ExUnit.CaptureIO

  test "selects a move" do
    human = Human.new()
    board = Board.grid()
    input = "2"

    capture_io(input, fn ->
      assert Human.get_move(human, board) == 2
    end)
  end
end
