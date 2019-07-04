defmodule Game do
  defstruct [:board, :players, :current_player]

  def new(players) do
    %Game{
      players: players,
      board: Board.grid(),
      current_player: Enum.at(players, 0),
    }
  end

  def play(game) do
    [player_one, player_two] = game.players
    if over?(game.board, [player_one.mark, player_two.mark]) do
      show_outcome(game.board, [player_one.mark, player_two.mark])
    else
      take_turn(game)
    end
  end

  def take_turn(%Game{board: board, current_player: current, players: players} = game) do
    [head, tail] = players
    move = Player.get_move(current)
    updated = Player.update_player(current)
    new_board = Board.mark_board(board, move, current.mark)
    new_players = [tail, updated]
    new_current = Enum.at(new_players, 0)
    play(%Game{game | board: new_board, current_player: new_current, players: new_players})
  end

  def over?(board, players) do
    Board.tie?(board, players) || Enum.at(Board.win?(board, players), 0)
  end

  def show_outcome(board, players) do
    [win, mark] = Board.win?(board, players)
    if win == true do
      Display.announce_win(mark)
    else
      Display.announce_tie
    end
  end
end
