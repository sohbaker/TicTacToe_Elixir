defmodule GameTest do
  use ExUnit.Case
  doctest Game

  test "knows that the game can continue" do
    player_one = %StubPlayer{mark: "X"}
    player_two = %StubPlayer{mark: "O"}
    game = Game.new(player_one, player_two)
    board = Board.grid()

    assert Game.over?(game, board) == false
  end

  test "player one makes a move" do
    player_one = %StubPlayer{mark: "X"}
    player_two = %StubPlayer{mark: "O"}

    %Game{board: board, current_player: current} =
      Game.new(player_one, player_two)
      |> Game.start()

    assert ["X", "2", "3", "4", "5", "6", "7", "8", "9"] == board
    assert %StubPlayer{mark: "O"} == current
  end
end
