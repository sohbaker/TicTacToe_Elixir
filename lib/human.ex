defmodule Human do 
  defstruct mark: nil

  def new() do 
    %Human{}
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
