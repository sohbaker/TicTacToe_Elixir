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

  def format_board(grid) do  
    line_separator = String.duplicate("-", length(grid))
    Enum.map(grid, fn x -> "#{x} | " end)
    |> clean_up_board(3, line_separator)
  end

  def clean_up_board(grid, n, line_separator) when n > 0 do
    first = Enum.take(grid, n - 1)   
    last = Enum.map(Enum.take(grid, -1), fn x -> String.replace(x, " | ", "\n") end)
    grid = Enum.drop(grid, n - 1)
    grid = Enum.drop(grid, -1)     
    middle = Enum.map_every(grid, n, fn x -> String.replace(x, " | ", "\n#{line_separator}\n") end)
    first ++  middle ++ last  
  end
end 
