defmodule GameTest do
  use ExUnit.Case
  doctest Game
  import ExUnit.CaptureIO

  test "knows that player x wins the game" do
    player_one = %StubPlayer{mark: "X", moves: [1, 2, 3]}
    player_two = %StubPlayer{mark: "O", moves: [4, 5]}
    players = [player_one, player_two]

    outcome = capture_io(fn ->
      Game.new(players)
      |> Game.play()
    end)

    assert String.contains?(outcome, Display.announce_win(player_one.mark)) == true
  end

  test "knows that player o wins the game" do
    player_one = %StubPlayer{mark: "X", moves: [1, 7, 8]}
    player_two = %StubPlayer{mark: "O", moves: [4, 5, 6]}
    players = [player_one, player_two]

    outcome = capture_io(fn ->
      Game.new(players)
      |> Game.play()
    end)

    assert String.contains?(outcome, Display.announce_win(player_two.mark)) == true
  end

  test "knows that the game has ended in a tie" do
    player_one = %StubPlayer{mark: "X", moves: [1, 2, 6, 7, 8]}
    player_two = %StubPlayer{mark: "O", moves: [3, 4, 5, 9]}
    players = [player_one, player_two]

    outcome = capture_io(fn ->
      Game.new(players)
      |> Game.play()
    end)

    assert String.contains?(outcome, Display.announce_tie) == true
  end
end
