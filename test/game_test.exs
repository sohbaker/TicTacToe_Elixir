defmodule GameTest do
  use ExUnit.Case
  doctest Game

  test "knows that the game can continue" do
    player_one = "X"
    player_two = "O"
    game = Game.new(player_one, player_two)
    board = Board.grid()

    assert Game.over?(game, board) == false
  end     
end 
