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
end
