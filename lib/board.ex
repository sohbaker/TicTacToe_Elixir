defmodule Board do
  def grid do
    [1, 2, 3, 4, 5, 6, 7, 8, 9]
  end

  def mark_board(board, position, mark) do
    List.replace_at(board, position - 1, mark)
  end

  def available_moves(board) do
    Enum.filter(board, fn x -> x != Mark.naught && x != Mark.cross end)
  end

  def valid?(board, position, [player_one, player_two]) do
    Enum.at(board, position - 1) != player_one &&
      Enum.at(board, position - 1) != player_two
  end

  def full?(board, [player_one, player_two]) do
    Enum.all?(board, fn x -> x == player_one || x == player_two end)
  end

  def win?(board, marks) do
    [first, second] = check_for_win(board, marks)
    cond do
      Enum.member?(first, true) == true ->
        [true] ++  Enum.take(first, -1)
      Enum.member?(second, true) == true ->
        [true] ++ Enum.take(second, -1)
      true ->
        [false, nil]
    end
  end

  def check_for_win(board, [player_one, player_two] = _marks) do
    [check_lines(board, player_one)] ++
      [check_lines(board, player_two)]
  end

  def check_lines(board, player_mark) do
    row_win(board, player_mark) ++
      column_win(board, player_mark) ++
        diagonal_win(board, player_mark) ++
          [player_mark]
  end

  def row_win(board, player_mark) do
    rows = [[0, 1, 2], [3, 4, 5], [6, 7, 8]]

    for row <- rows do
      Enum.all?(row, fn x -> Enum.at(board, x) == player_mark end)
    end
  end

  def column_win(board, player_mark) do
    columns = [[0, 3, 6], [1, 4, 7], [2, 5, 8]]

    for column <- columns do
      Enum.all?(column, fn x -> Enum.at(board, x) == player_mark end)
    end
  end

  def diagonal_win(board, player_mark) do
    diagonals = [[2, 4, 6], [0, 4, 8]]

    for diagonal <- diagonals do
      Enum.all?(diagonal, fn x -> Enum.at(board, x) == player_mark end)
    end
  end

  def tie?(board, marks) do
    Board.full?(board, marks) == true && Enum.at(Board.win?(board, marks), 0) == false
  end
end
