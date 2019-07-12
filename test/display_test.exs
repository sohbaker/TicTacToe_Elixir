defmodule DisplayTest do
  use ExUnit.Case
  doctest Display
  import ExUnit.CaptureIO

  test "prints a greeting" do
    assert capture_io(fn ->
             Display.greeting()
           end) == "Welcome to Tic Tac Toe!\n"
  end

  test "prompts a player to make a move" do
    mark = "X"

    assert capture_io(fn ->
             Display.prompt_player(mark)
           end) == "X, pick a move from 1-9: "
  end

  test "notifies a player of an invalid move" do
    assert capture_io(fn ->
             Display.notify_invalid()
           end) == "Invalid move. Please try again\n"
  end

  test "shows the board" do
    grid = Board.grid()

    assert capture_io(fn ->
             Display.show_board(grid)
           end) == """
           1 | 2 | 3
           ---------
           4 | 5 | 6
           ---------
           7 | 8 | 9

           """
  end

  test "announces a winner" do
    assert Display.announce_win("X") == "Player X wins!"
  end

  test "announces a tie" do
    assert Display.announce_tie() == "It's a tie!"
  end

  test "takes an input from a user" do
    prompt = "Make a move: X\n"

    assert capture_io("1", fn ->
             IO.write(Display.get_input(prompt))
           end) == "Make a move: X\n1"
  end

  test "outputs given string to the screen" do
    string = "Tic Tac Toe"

    assert capture_io(fn ->
             Display.print_to_screen(string)
           end) == "#{string}\n"
  end
end
