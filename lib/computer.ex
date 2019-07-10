defmodule Computer do
  defstruct mark: "O"

  def new(mark \\ "O") do
    %Computer{mark: mark}
  end

  def get_mark(computer) do
    computer.mark
  end
end
