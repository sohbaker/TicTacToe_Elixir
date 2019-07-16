defmodule Computer do
  defstruct mark: Mark.naught

  def new(mark \\ Mark.naught) do
    %Computer{mark: mark}
  end

  def get_move(_computer, board) do
    :timer.sleep(500)

    Board.available_moves(board)
    |> Enum.random()
  end
end
