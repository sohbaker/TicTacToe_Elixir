defmodule GameLoader do
  def human_human do
    player_x = %Human{}
    player_o = %Human{mark: "O"}
    Display.greeting
    |> Display.print_to_screen
    Game.new(player_x, player_o)
    |> Game.play()
  end

  def human_computer do
    player_x = %Human{}
    player_o = %Computer{}
    Display.greeting
    |> Display.print_to_screen
    Game.new(player_x, player_o)
    |> Game.play()
  end
end
