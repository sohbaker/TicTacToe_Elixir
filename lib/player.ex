defprotocol Player do
  def get_move(player, board)
end

defimpl Player, for: Human do
  def get_move(human, _board) do
    Display.prompt_player(human.mark)
    |> Display.get_input
    |> String.to_integer
  end
end

defimpl Player, for: Computer do
  def get_move(computer, board) do
    Display.prompt_player(computer.mark)
    :timer.sleep(500)
    Board.available_moves(board)
    |> Enum.random()
  end
end
