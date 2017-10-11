require_relative 'board'
require_relative 'human_player'
require_relative 'computer_player'

class Game
  attr_reader :board
  def initialize(p1, p2)
    @board = Board.new()
    @player_1, @player_2 = p1, p2
    @p1_turn = true
  end

  def play_turn
    if @p1_turn
      move = @player_1.get_move, :X
    else
      move = @player_2.get_move, :O
    end
    board.place_mark(*move)
    switch_players!
  end

  def switch_players!
    @p1_turn = !@p1_turn
  end

  def current_player
    @p1_turn ? @player_1 : @player_2
  end

  def self.play
    print "whats your name? "
    name = gets.chomp
    human = HumanPlayer.new(name)
    cpu = ComputerPlayer.new("MR. ROBOTO")
    cpu.mark = :O
    game = Game.new(human, cpu)
    board = game.board
    until board.over?
      puts "#{game.current_player.name}'s turn:"
      game.current_player.display(board)
      game.play_turn
    end
    human.display(board)
    if winner = board.winner
      puts "#{winner} wins!!"
    else
      puts "Tie Game"
    end
  end
end
