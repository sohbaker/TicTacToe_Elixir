defmodule GameTest do
  use ExUnit.Case
  doctest Game
  import ExUnit.CaptureIO

  test "knows that player x wins the game" do
    player_x = %StubPlayer{mark: "X", moves: [1, 2, 3]}
    player_o = %StubPlayer{mark: "O", moves: [4, 5]}

    outcome = capture_io(fn ->
      Game.new(player_x, player_o)
      |> Game.play()
    end)

    assert String.contains?(outcome, Display.announce_win(player_x.mark)) == true
  end

  test "knows that player o wins the game" do
    player_x = %StubPlayer{mark: "X", moves: [1, 7, 8]}
    player_o = %StubPlayer{mark: "O", moves: [4, 5, 6]}

    outcome = capture_io(fn ->
      Game.new(player_x, player_o)
      |> Game.play()
    end)

    assert String.contains?(outcome, Display.announce_win(player_o.mark)) == true
  end

  test "knows that the game has ended in a tie" do
    player_x = %StubPlayer{mark: "X", moves: [1, 2, 6, 7, 8]}
    player_o = %StubPlayer{mark: "O", moves: [3, 4, 5, 9]}

    outcome = capture_io(fn ->
      Game.new(player_x, player_o)
      |> Game.play()
    end)

    assert String.contains?(outcome, Display.announce_tie) == true
  end
end
