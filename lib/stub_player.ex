defmodule StubPlayer do
  defstruct [:mark, :moves]

  def get_move(%StubPlayer{moves: [head | _tail]}, _board) do
    head
  end

  def update_player(%StubPlayer{moves: [_head | tail]} = player) do
    %StubPlayer{player | moves: tail}
  end
end
