defprotocol Player do
  def get_move(player)
  def update_player(player)
end

defimpl Player, for: Human do
  def get_move(human) do
    Display.get_input(Display.prompt_player(human.mark))
    |> String.to_integer
  end
end

defimpl Player, for: StubPlayer do
  def get_move(%StubPlayer{moves: [head | _tail]}) do
    head
  end

  def update_player(%StubPlayer{moves: [_head | tail]} = player) do
    %StubPlayer{player | moves: tail}
  end
end
