defmodule Human do
  defstruct mark: Mark.cross

  def new(mark \\ Mark.cross) do
    %Human{mark: mark}
  end

  def get_move(human, _board) do
    Display.prompt_player(human.mark)
    |> Display.get_input()
    |> String.to_integer()
  end
end
