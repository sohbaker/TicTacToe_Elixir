defmodule GameLoader do
  def human_human do
    player_x = %Human{}
    player_o = %Human{mark: "O"}

    Display.greeting()

    Game.new(player_x, player_o)
    |> CLI.Interact.play()
  end

  def human_computer do
    player_x = %Human{}
    player_o = %Computer{}

    Display.greeting()

    Game.new(player_x, player_o)
    |> CLI.Interact.play()
  end
end
