defmodule InteractTest do
  use ExUnit.Case
  doctest Interact
  import ExUnit.CaptureIO

  test "knows that player x wins the game" do
    player_x = %Human{}
    player_o = %Human{mark: "O"}
    input = "1\n4\n2\n5\n3\n"

    outcome =
      capture_io(input, fn ->
        Game.new(player_x, player_o)
        |> Interact.play()
      end)

    assert String.contains?(outcome, Display.announce_win(player_x.mark)) == true
  end

  test "knows that player o wins the game" do
    player_x = %Human{}
    player_o = %Human{mark: "O"}
    input = "1\n4\n7\n5\n8\n6\n"

    outcome =
      capture_io(input, fn ->
        Game.new(player_x, player_o)
        |> Interact.play()
      end)

    assert String.contains?(outcome, Display.announce_win(player_o.mark)) == true
  end

  test "knows that the game has ended in a tie" do
    player_x = %Human{}
    player_o = %Human{mark: "O"}
    input = "1\n3\n2\n4\n6\n5\n7\n9\n8\n"

    outcome =
      capture_io(input, fn ->
        Game.new(player_x, player_o)
        |> Interact.play()
      end)

    assert String.contains?(outcome, Display.announce_tie()) == true
  end
end
