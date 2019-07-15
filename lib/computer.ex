defmodule Computer do
  defstruct mark: "O"

  def new(mark \\ "O") do
    %Computer{mark: mark}
  end

  def get_move(computer, board) do
    Display.prompt_player(computer.mark)
    |> Display.print_to_screen()
    :timer.sleep(500)

    Board.available_moves(board)
    |> Enum.random()
  end
end
