defmodule Display do 
  def greeting do 
    "Welcome to Tic Tac Toe!"
  end
  
  def prompt_player(mark) do
    "Make a move: #{mark}" 
  end

  def notify_invalid do 
    "Invalid move. Please try again"
  end

  def show_board(grid) do
    format_board(grid)
    |> List.flatten
    |> Enum.join
  end
  
  def announce_win(mark) do 
    "Player #{mark} wins!"
  end
  
  def announce_tie do
   "It's a tie!"
  end

  def get_input(prompt) do 
    IO.gets(prompt)
    |> String.trim
  end
 
  def print_to_screen(string) do 
   IO.puts(string)
  end

  defp format_board(grid) do  
    line_separator = String.duplicate("-", length(grid))
    Enum.map(grid, fn x -> "#{x} | " end)
    |> prettify_board(3, line_separator)
  end

  defp prettify_board(grid, n, line_separator) when n > 0 do
    first_two_items  = Enum.take(grid, n - 1)   
    last_item  = Enum.map(Enum.take(grid, -1), fn x -> String.replace(x, " | ", "\n") end)
    grid = Enum.drop(grid, n - 1)
    grid = Enum.drop(grid, -1)     
    body = Enum.map_every(grid, n, fn x -> String.replace(x, " | ", "\n#{line_separator}\n") end)
    first_two_items ++ body ++ last_item  
  end
end 
