defmodule Board do
  @naught Mark.naught()
  @cross Mark.cross()

  def grid do
    [1, 2, 3, 4, 5, 6, 7, 8, 9]
  end

  def mark_board(board, position, mark) do
    List.replace_at(board, position - 1, mark)
  end

  def available_moves(board) do
    Enum.filter(board, fn x -> x != @naught && x != @cross end)
  end

  def valid?(board, position) do
    Enum.at(board, position - 1) != @naught &&
      Enum.at(board, position - 1) != @cross
  end

  def full?(board) do
    Enum.all?(board, fn x -> x == @naught || x == @cross end)
  end

  def win?(board) do
    [player_one_win, player_two_win] = check_for_win(board)

    cond do
      Enum.member?(player_one_win, true) == true ->
        [true] ++ Enum.take(player_one_win, -1)

      Enum.member?(player_two_win, true) == true ->
        [true] ++ Enum.take(player_two_win, -1)

      true ->
        [false, nil]
    end
  end

  def check_for_win(board) do
    [check_lines(board, @naught)] ++
      [check_lines(board, @cross)]
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

  def tie?(board) do
    Board.full?(board) == true && Enum.at(Board.win?(board), 0) == false
  end
end
