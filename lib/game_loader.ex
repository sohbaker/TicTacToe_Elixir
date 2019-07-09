defmodule GameLoader do
  def start_game do
    player_x = %Human{}
    player_o = %Human{mark: "O"}
    Display.greeting |> Display.print_to_screen
    Game.new(player_x, player_o)
    |> Game.play()
  end
end
