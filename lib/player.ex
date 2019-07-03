defprotocol Player do
  def get_move(player)
end

defimpl Player, for: Human do
  def get_move(human) do
    Display.get_input(Display.prompt_player(human.mark))
    |> String.to_integer
  end
end

defimpl Player, for: StubPlayer do
  def get_move(_player) do
    1
  end
end
