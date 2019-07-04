defmodule GameTest do
  use ExUnit.Case
  doctest Game

  test "knows that the game can continue" do
    player_one = %StubPlayer{mark: "X"}
    player_two = %StubPlayer{mark: "O"}
    players = [player_one, player_two]
    game = Game.new(players)
    board = Board.grid()

    assert Game.over?(board, game.players) == false
  end

  test "knows that player x wins the game" do
    player_one = %StubPlayer{mark: "X", moves: [1, 2, 3]}
    player_two = %StubPlayer{mark: "O", moves: [4, 5]}
    players = [player_one, player_two]

    outcome  =
      Game.new(players)
      |> Game.play()

    assert outcome == Display.announce_win(player_one.mark)
  end

  test "knows that player o wins the game" do
    player_one = %StubPlayer{mark: "X", moves: [1, 7, 8]}
    player_two = %StubPlayer{mark: "O", moves: [4, 5, 6]}
    players = [player_one, player_two]

    outcome =
     Game.new(players)
    |> Game.play()

    assert outcome == Display.announce_win(player_two.mark)
  end

  test "knows that the game has ended in a tie" do
    player_one = %StubPlayer{mark: "X", moves: [1, 2, 6, 7, 8]}
    player_two = %StubPlayer{mark: "O", moves: [3, 4, 5, 9]}
    players = [player_one, player_two]

    outcome  =
      Game.new(players)
      |> Game.play()

    assert outcome == Display.announce_tie
  end
end
