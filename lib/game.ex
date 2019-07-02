defmodule Game do 
  defstruct [:player_one, :player_two, :current_player]

  def new(player_one_mark, player_two_mark ) do
    game = %Game{
      player_one: %Human{mark: player_one_mark},
      player_two: %Human{mark: player_two_mark},
    }
    %Game{game| current_player: game.player_one}
  end
  
  def over?(game, board) do 
    Board.tie?(board, game.player_one.mark, game.player_two.mark) || Board.win?(board, game.player_one.mark) || Board.win?(board, game.player_two.mark)
  end
end
