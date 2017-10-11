require "byebug"
class Code
  PEGS = {Red: 'r', Orange: 'o', Yellow: 'y', Green: 'g', Blue: 'b', Purple: 'p'}
  attr_reader :PEGS, :pegs

  def initialize(arr)
    arr.map(&:downcase!)
    @pegs = arr
  end

  def self.parse(str)
      code = str.downcase.split('')
      new(code) if valid(code)
  end

  def [](arg)
    pegs[arg]
  end

  def exact_matches(guess)
    idx = -1
    count = guess.pegs.count do |peg|
     idx += 1
     peg == pegs[idx]
    end
    count
  end

  def near_matches(guess)
    correct = {}
    guess.pegs.each.with_index do |peg, idx|
      if pegs.include?(peg) && pegs[idx] != peg
        correct[peg] = true
      end
    end
    correct.length
  end

  def ==(guess)
    return false if guess.class != Code
    guess_pegs = guess.pegs
    (0..3).all? {|idx| guess_pegs[idx] == pegs[idx]}
  end

  def self.valid(arr)
    colors = PEGS.values
    valid = arr.all? { |color| colors.include? color} && arr.length == 4
    if valid
      arr
    else
      raise "Invalid Code"
      return false
    end
  end


  def self.random
    color = PEGS.values
    rand_code = color.shuffle[0..3]
    new(rand_code)
  end


end

class Game
  attr_reader :secret_code

  def initialize(code = nil)
    if code
      @secret_code = code
    else
      @secret_code = Code.random
    end
  end

  def get_guess
    print "Make a guess: "
    guess = gets.chomp
    Code.parse(guess)
  end

  def display_matches(code)
    exact = secret_code.exact_matches(code)
    near = secret_code.near_matches(code)
    puts "exact matches: #{exact}"
    puts "near matches: #{near}"
  end

  def self.play
    game = self.new
    guesses = 0
    puts game.secret_code.pegs
    while guesses <= 10
      puts "Guess #{guesses}:"
      guess = game.get_guess
      if guess == game.secret_code
        puts "You got it in #{guesses} guesses"
        break
      end
      game.display_matches(guess)
      guesses += 1
    end
  end

end
