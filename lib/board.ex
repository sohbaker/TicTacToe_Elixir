defmodule Board do
  def grid do
    ["1", "2", "3", "4", "5", "6", "7", "8", "9"]
  end

  def mark_board(board, position, mark) do
   List.replace_at(board, position - 1, mark)
  end
  
  def available_moves(board, player_one_mark, player_two_mark) do 
    Enum.filter(board, fn x -> x != player_one_mark && x != player_two_mark end)
  end
  
  def valid?(board, position, player_one_mark, player_two_mark) do 
    Enum.at(board, position - 1) != player_one_mark && Enum.at(board, position - 1) != player_two_mark
  end
 
  def full?(board, player_one_mark, player_two_mark) do
    Enum.all?(board, fn x -> x == player_one_mark || x == player_two_mark end)
  end
  
  def win?(board, player_mark) do
    Enum.member?(check_lines(board, player_mark), true) 
  end  
 
  def check_lines(board, player_mark) do 
    row_win(board, player_mark) ++
    column_win(board, player_mark) ++  
    diagonal_win(board, player_mark)
  end 

  def row_win(board, player_mark)  do 
    rows = [[0, 1, 2], [3, 4, 5], [6, 7, 8]]
    for row <- rows do
      Enum.all?(row, fn x -> Enum.at(board, x) == player_mark end)
    end
  end

  def column_win(board, player_mark)  do 
    columns = [[0, 3, 6], [1, 4, 7], [2, 5, 8]]
    for column <- columns do
      Enum.all?(column, fn x -> Enum.at(board, x) == player_mark end)
    end
  end

  def diagonal_win(board, player_mark)  do 
    diagonals = [[2, 4, 6], [0, 4, 8]]
    for diagonal <- diagonals do
      Enum.all?(diagonal, fn x -> Enum.at(board, x) == player_mark end)
    end
  end

  def tie?(board, mark_one, mark_two) do 
    full?(board, mark_one, mark_two) == true && win?(board, mark_one) == false && win?(board, mark_two) == false
  end

  def grid_rows do 
    Enum.chunk_every(grid(), 3)
  end
end
