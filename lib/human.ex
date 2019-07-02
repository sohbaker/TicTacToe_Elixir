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
end
