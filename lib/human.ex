defmodule Human do
  defstruct mark: "X"

  def new(mark \\ "X") do
    %Human{mark: mark}
  end

  def get_move(human, _board) do
    Display.prompt_player(human.mark)
    |> Display.get_input()
    |> String.to_integer()
  end
end
