require "byebug"
class Hangman
  attr_reader :guesser, :referee, :board


  def initialize(players)
    @guesser = players[:guesser]
    @referee = players[:referee]
  end

  def self.comp_v_human
    h = HumanPlayer.new
    cp = ComputerPlayer.new
    new({referee: h, guesser: cp})
  end

  def over?
    board.all?{|space| space != nil}
  end

  def self.play
    game = comp_v_human
    game.setup
    guesses = 0
    while true
      guesses += 1
      game.take_turn
      break if game.over?
    end
    puts "You word is: #{game.board.join}"
    puts "computer wins in #{guesses} guesses"
  end

  def setup
    length  = referee.pick_secret_word
    guesser.register_secret_length(length)
    @board = Array.new(length)
  end

  def take_turn
    guess= guesser.guess(board)
    if guess.length != 1
      @board = guess.split('')
    else
      check= referee.check_guess(guess)
      update_board(check, guess)
      guesser.handle_response(guess, check)
    end
    print_board
  end

  def update_board(update, letter)
    update.each{|space| board[space] = letter}
  end

  def print_board
    board.map do |space|
      space = '_ ' if !space
      print space
    end
    puts
  end





end

class HumanPlayer

  def initialize
  end

  def pick_secret_word
    print "how long is your word? "
    gets.chomp.to_i
  end

  def check_guess(guess)
    print "At what position is \"#{guess}\". If not present press enter "
    resp = gets.chomp
    resp = resp.split(' ')
    resp.map! {|pos| pos.to_i - 1}
    resp
  end

end

class ComputerPlayer

  def initialize(dictionary = nil)
    if dictionary
      @dictionary = dictionary
    else
      @dictionary = []
      File.foreach("./lib/dictionary.txt") do |line|
         @dictionary << line.chomp
      end
    end
  end

  #referee fxns
  def pick_secret_word
    @secret_word= @dictionary.shuffle.last.split('')
    return @secret_word.length
  end

  def check_guess(guess)
    @secret_word.each_index.select{|idx| @secret_word[idx] == guess}
  end

  #guesser fxns
  def register_secret_length(len)
    @word_length = len
    @dictionary = @dictionary.select {|word| word.length == len}
  end


  def most_common_letter(board)
    all_words = @dictionary.join
    freq = Hash.new(0)
    all_words.split('').each do |letter|
      freq[letter] += 1 unless board.include?(letter)
    end
    freq = freq.sort{|a,b| a[1] <=> b[1]}
    freq.last[0]
  end

  def word_match_board(board, word)
    board.each_index.all? do |idx|
      letter = board[idx]
      if letter
        word[idx] == letter
      else
        true
      end
    end
  end

  def update_dictionary(board)
    @dictionary = @dictionary.select do |word|
      word_match_board(board, word)
    end
  end


  def guess(board)
    update_dictionary(board)
    if @dictionary.empty?
      throw "No words left"
    else
      #guesses word sooner but breaks rspec
      # if @dictionary.length == 1
      #   @dictionary[0]
      # else
        most_common_letter(board)
      #end
    end
  end

  def remove_words_with(letter)
    @dictionary = @dictionary.select {|word| !word.include?(letter)}
  end

  def possible_match(word, check, letter)
    word.split('').each_index.all? do |idx|
      if check.include?(idx)
        word[idx] == letter
      else
        word[idx] != letter
      end
    end
  end

  def candidate_words
    @dictionary
  end

  def handle_response(letter, check)
    remove_words_with(letter) if check.empty?
    @dictionary = @dictionary.select do |word|
      possible_match(word, check, letter)
    end
  end
end
