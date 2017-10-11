require "byebug"

class Player
  attr_reader :name
  attr_accessor :losses

  def initialize(name)
    @name = name
    @losses = 0
  end

  def show_score
    "GHOST"[0...@losses]
  end

  def get_letter(_fragment)
    puts "It is #{@name}'s turn"
    puts "Enter a letter"
    gets.chomp.downcase
  end
end

class ComputerPlayer < Player
  ALPHABET = ('a'..'z').to_a
  def initialize()
    @name = 'cpu'
    @losses = 0
    @dictionary = {}
    File.open("./dictionary.txt", "r").each do |line|
      @dictionary[line.chomp] = true
    end
  end

  def find_possible_words(fragment)
    possible_words = @dictionary.select do |entry, _value|
      entry[0, fragment.length] == fragment
    end
    possible_words
  end

  def find_winning_move(fragment)
    winners = ALPHABET.select do |letter|
      possible_words = find_possible_words(fragment+letter)
      if possible_words.empty?
        false
      else
        possible_words.all? {|word| (word.length - fragment.length).even? }
      end
    end
    puts "WINNERS: #{winners}"
    winners.sample
  end

  def random_move(fragment, possible_words)
    puts "RANDOM MOVE"
    len = fragment.length
    possible_words.sample[len]
  end

  def choose_letter(fragment)
    possible_words = find_possible_words(fragment)
    if possible_words.all? {|word| word.length == fragment.length+1}
      possible_words.sample[-1]
    else
      find_winning_move(fragment) || random_move(fragment, possible_words)
    end
  end

  def get_letter(fragment)
    move = choose_letter(fragment)
    puts "cpu plays: #{move}"
    move
  end

end
