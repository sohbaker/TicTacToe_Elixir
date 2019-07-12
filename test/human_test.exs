defmodule HumanTest do
  use ExUnit.Case
  doctest Human
  import ExUnit.CaptureIO

  test "selects a move" do
    human = Human.new()
    board = Board.grid()
    capture_io("2", fn ->
      assert Human.get_move(human, board) == 2
    end)
  end
end
