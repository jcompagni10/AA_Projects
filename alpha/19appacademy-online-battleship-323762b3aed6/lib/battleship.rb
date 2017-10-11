require 'byebug'
class BattleshipGame
  attr_reader :board, :player, :cur_turn

  def initialize(player, board)
    @board = board
    @player = player
    @cur_turn = player
  end

  def attack(pos)
    if board.attack(pos)
      puts "HIT!"
    else
      puts "MISS!"
    end
  end

  def count
    board.count
  end

  def game_over?
    board.won?
  end

  def play_turn
    pos = cur_turn.get_play
    attack(pos)
  end

  def play
    5.times { board.place_random_ship }
    while !game_over?
      play_turn
    end
    puts "you win!!"
  end

end
