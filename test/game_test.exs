defmodule GameTest do
  use ExUnit.Case
  doctest Game

  test "knows that the game can continue" do
    player_one = %StubPlayer{mark: "X"}
    player_two = %StubPlayer{mark: "O"}
    players = [player_one, player_two]
    game = Game.new(players)
    board = Board.grid()

    assert Game.over?(game, board) == false
  end

  test "player one makes a move" do
    player_one = %StubPlayer{mark: "X", moves: [1]}
    player_two = %StubPlayer{mark: "O"}
    players = [player_one, player_two]

    %Game{board: board, current_player: current} =
      Game.new(players)
      |> Game.start()

    assert ["X", "2", "3", "4", "5", "6", "7", "8", "9"] == board
    assert %StubPlayer{mark: "O"} == current
  end

  test "player two makes a move" do
    player_one = %StubPlayer{mark: "X", moves: [1]}
    player_two = %StubPlayer{mark: "O", moves: [2]}
    players = [player_one, player_two]

    %Game{board: board, current_player: current} =
      Game.new(players)
      |> Game.start()
      |> Game.play_turn()

    assert ["X", "O", "3", "4", "5", "6", "7", "8", "9"] == board
    assert %StubPlayer{mark: "X", moves: []} == current
  end

  test "player one makes multiple moves" do
    player_one = %StubPlayer{mark: "X", moves: [1, 2, 3]}
    player_two = %StubPlayer{mark: "O", moves: [4, 5]}
    players = [player_one, player_two]

    %Game{board: board, current_player: current} =
      Game.new(players)
      |> Game.start()
      |> Game.play_turn()
      |> Game.play_turn()
      |> Game.play_turn()

    assert ["X", "X", "3", "O", "O", "6", "7", "8", "9"] == board
    assert %StubPlayer{mark: "X", moves: [3]} == current
  end

  test "knows that player x wins the game" do
    player_one = %StubPlayer{mark: "X", moves: [1, 2, 3]}
    player_two = %StubPlayer{mark: "O", moves: [4, 5]}
    players = [player_one, player_two]

    %Game{board: board} =
      Game.new(players)
      |> Game.start()
      |> Game.play_turn()
      |> Game.play_turn()
      |> Game.play_turn()
      |> Game.play_turn()

    assert ["X", "X", "X", "O", "O", "6", "7", "8", "9"] == board
    assert Game.show_outcome(board, [player_one.mark, player_one.mark]) == Display.announce_win(player_one.mark)
  end
end
