defmodule GameLoader do
  def human_human do
    player_x = %Human{}
    player_o = %Human{mark: "O"}

    Game.new(player_x, player_o)
  end

  def human_computer do
    player_x = %Human{}
    player_o = %Computer{}

    Game.new(player_x, player_o)
  end
end
