defprotocol Player do
  def get_move(player, board)
  def update_player(player)
end

defimpl Player, for: Human do
  def get_move(human, board) do
    Display.show_board(board) |> Display.print_to_screen
    Display.prompt_player(human.mark) |> Display.get_input
    |> String.to_integer
  end

  def update_player(human) do
    human
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
