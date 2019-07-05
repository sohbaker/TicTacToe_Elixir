defmodule Human do
  defstruct mark: "X"

  def new(mark \\ "X") do
    %Human{mark: mark}
  end

  def get_mark(human) do
    human.mark
  end

  def get_move(human, board) do
    Display.show_board(board) |> Display.print_to_screen
    Display.prompt_player(human.mark)
    |> Display.get_input
    |> String.to_integer
  end
end
