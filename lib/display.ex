defmodule Display do
  def greeting do
    "Welcome to Tic Tac Toe!"
  end

  def prompt_player(mark) do
    "#{mark}, pick a move from 1-9: "
  end

  def notify_invalid do
    "Invalid move. Please try again"
  end

  def show_board(grid) do
    Display.print_to_screen(format_board(grid))
  end

  def announce_win(mark) do
    "Player #{mark} wins!"
  end

  def announce_tie do
    "It's a tie!"
  end

  def get_input(prompt) do
    IO.gets(prompt)
    |> String.trim()
  end

  def print_to_screen(string) do
    IO.puts(string)
  end

  defp format_board(grid) do
    line_separator = String.duplicate("-", length(grid))
    rows = Enum.chunk_every(grid, 3)
    for row <- rows do
      Enum.join(row, " | ")
      |> Kernel.<>("\n")
    end
    |> Enum.join("#{line_separator}\n")
  end
end
