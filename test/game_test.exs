defmodule GameTest do
  use ExUnit.Case
  doctest Game
  import ExUnit.CaptureIO

  test "updates the board and players when a turn is taken" do
    player_x = %Human{}
    player_o = %Human{mark: "O"}
    board = Board.grid()
    move = 1

    game = Game.new(player_x, player_o)

    outcome = Game.take_turn(move, game)

    assert outcome.current_player == player_o
    assert outcome.other_player == player_x
    assert Enum.member?(outcome.board, player_x.mark) == true
  end
end
