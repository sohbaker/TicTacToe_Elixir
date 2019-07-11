defprotocol Player do
  def get_move(player, board)
  def update_player(player)
end

defimpl Player, for: Human do
  def get_move(human, _board) do
    Display.prompt_player(human.mark) |> Display.get_input
    |> String.to_integer
  end

  def update_player(human) do
    human
  end
end

defimpl Player, for: Computer do
  def get_move(computer, board) do
    Display.prompt_player(computer.mark)
    |> Display.print_to_screen()
    :timer.sleep(500)
    Board.available_moves(board)
    |> Enum.random()
  end

  def update_player(computer) do
    computer
  end
end

defimpl Player, for: StubPlayer do
  def get_move(%StubPlayer{moves: [head | _tail]}, _board) do
    head
  end

  def update_player(%StubPlayer{moves: [_head | tail]} = player) do
    %StubPlayer{player | moves: tail}
  end
end
