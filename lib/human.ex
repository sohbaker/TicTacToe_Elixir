defmodule Human do 
  defstruct mark: "X"

  def new(mark \\ "X") do 
    %Human{mark: mark}
  end

  def add_mark(human, mark) do
    %Human{human | mark: mark}
  end 
 
  def get_mark(human) do 
    human.mark
  end

  def get_move(human) do 
    Display.get_input(Display.prompt_player(human.mark))
    |> String.to_integer
  end
end
