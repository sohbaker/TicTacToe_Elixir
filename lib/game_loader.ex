defmodule GameLoader do
  def start_game do
    player_one = %Human{}
    player_two = %Human{mark: "O"}
    Display.greeting |> Display.print_to_screen
    [player_one, player_two]
              |> Game.new()
              |> Game.play()
  end
end
