defmodule Game do
  defstruct [:board, :players, :current_player]

  def new(players) do
    game = %Game{
      players: players,
      board: Board.grid()
    }

    %Game{game | current_player: Enum.at(players,0)}
  end

  def start(%Game{board: board, current_player: player} = game) do
    [head | tail] = game.players
    move = Player.get_move(head)
    updated = Player.update_player(head)
    new_board = Board.mark_board(board, move, player.mark)
    new_players = tail ++ [updated]
    current = Enum.at(new_players,0)
    %Game{game | board: new_board, current_player: current, players: new_players}
  end

  def play_turn(game) do
    [head | tail] = game.players
    move = Player.get_move(head)
    updated = Player.update_player(head)
    new_board = Board.mark_board(game.board, move, game.current_player.mark)
    new_players = tail ++ [updated]
    current = Enum.at(new_players,0)
    %Game{game | board: new_board, current_player: current, players: new_players}
  end

  def toggle_player(game, player) do
    if player.mark == game.player_one.mark do
      game.player_two
    else
      game.player_one
    end
  end

  def over?(game, board) do
    Board.tie?(board, game.player_one.mark, game.player_two.mark) ||
      Board.win?(board, game.player_one.mark) || Board.win?(board, game.player_two.mark)
  end
end
