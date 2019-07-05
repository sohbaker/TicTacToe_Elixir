defmodule GameLoader do
  def start_game do
    player_one = %Human{mark: "X"}
    player_two = %Human{mark: "O"}
    players = [player_one, player_two]
              |> Game.new()
              |> Game.play()
  end
end
