require_relative 'Player.rb'

class Ghost
  def initialize(options)

    @fragment = ''
    @players = options[:players]
    @current_player = @players.sample
    dictionary_file = options[:dictionary] || "./dictionary.txt"
    @dictionary = {}
    File.open(dictionary_file, "r").each do |line|
      @dictionary[line.chomp] = true
    end
  end

  def switch_players
    ind = @players.index(@current_player)
    @current_player = @players[ind + 1] || @players[0]
  end

  def valid_play?(letter)
    word = @fragment + letter
    @dictionary.any? do |entry, _value|
      entry[0, word.length] == word
    end
  end

  def game_over?
    @dictionary[@fragment]
  end

  def play_turn
    until game_over?
      switch_players
      puts "the current fragment is #{@fragment}"
      letter = @current_player.get_letter(@fragment)
      until valid_play?(letter)
        puts "Invalid play. Please try again."
        letter = @current_player.get_letter(@fragment)
      end
      @fragment << letter
    end
    @current_player.losses += 1
    puts "Game OVER! #{@current_player.name} LOST the current round!!"
    @fragment = ''

  end

  def play
    until @players.length == 1
      play_turn
      @players.each do |player|
        puts "#{player.name}: #{player.show_score}"
      end
      @players.reject! { |player| player.losses == 5 }
    end
    puts "#{@players[0].name} has won!!!!!!!"

  end
end

if __FILE__ == $0

  puts "Please enter number of players:"
  # players_num = gets.chomp.to_i
  # players = []
  # players_num.times do |i|
  #   puts "Enter player #{i+1} name:"
  #   name = gets.chomp
  #   if name == "cpu"
  #     players << ComputerPlayer.new("CPU")
  #   else
  #     players << Player.new(name)
  #   end
  # end
  players = [Player.new("jcp"), ComputerPlayer.new]
  options = { players: players }
  game = Ghost.new(options)
  game.play
end
#
