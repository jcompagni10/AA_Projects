# Towers of Hanoi
#
# Write a Towers of Hanoi game:
# http://en.wikipedia.org/wiki/Towers_of_hanoi
#
# In a class `TowersOfHanoi`, keep a `towers` instance variable that is an array
# of three arrays. Each subarray should represent a tower. Each tower should
# store integers representing the size of its discs. Expose this instance
# variable with an `attr_reader`.
#
# You'll want a `#play` method. In a loop, prompt the user using puts. Ask what
# pile to select a disc from. The pile should be the index of a tower in your
# `@towers` array. Use gets.chomp
# (http://andreacfm.com/2011/06/11/learning-ruby-gets.chomp-and-chomp.html) to get an
# answer. Similarly, find out which pile the user wants to move the disc to.
# Next, you'll want to do different things depending on whether or not the move
# is valid. Finally, if they have succeeded in moving all of the discs to
# another pile, they win! The loop should end.
#
# You'll want a `TowersOfHanoi#render` method. Don't spend too much time on
# this, just get it playable.
#
# Think about what other helper methods you might want. Here's a list of all the
# instance methods I had in my TowersOfHanoi class:
# * initialize
# * play
# * render
# * won?
# * valid_move?(from_tower, to_tower)
# * move(from_tower, to_tower)
#
# Make sure that the game works in the console. There are also some specs to
# keep you on the right track:
#
# ```bash
# bundle exec rspec spec/towers_of_hanoi_spec.rb
# ```
#
# Make sure to run bundle install first! The specs assume you've implemented the
# methods named above.
require "byebug"
class TowersOfHanoi
  attr_accessor :towers
  def initialize(size = 3)
    @towers = Array.new(3) {Array.new()}
    @size = size
    (1..size).to_a.reverse.each{ |n| towers[0] << n }
  end

  def move(t1, t2)
      towers[t2] << towers[t1].pop
  end

  def valid_move?(t1, t2)
    return false if towers[t1].empty?
    return true if towers[t2].empty?
    towers[t1].last < towers[t2].last
  end

  def won?
    towers[0].empty? && (towers[1].empty? || towers[2].empty?)
  end

  def render
    puts
    (0..@size).to_a.reverse.each do |cur_row|
      row = Array.new(3)
      (0..2).each do |tower|
        val = (@towers[tower][cur_row] || 0 )
        disk = " " * (@size-val) +  "." * val
        row[tower] = "#{disk}|#{disk.reverse}"
      end
      puts row.join("   ")
    end
    puts
  end

  def play
    input = ""
    puts "Welcome to towers of Hanoi!!! type 'quit' to exit at any time"
    render
    while input != "quit"
      puts "move from"
      input = gets.chomp
      if input == "quit"
        break
      else
        t1 = input.to_i
      end
      puts "move from tower #{t1} to?"
      input = gets.chomp
      if input == "quit"
        break
      else
        t2 = input.to_i
      end
      if valid_move?(t1, t2)
        move(t1,t2)
        render
      else
        puts "invalid move"
      end
      if won?
        puts "~~~~~~~~~~~~~~~\n       YOU WON \n~~~~~~~~~~~~~~~"
        puts "play again y/n?\n"
        input = gets.chomp
        if input == "n"
          input = "quit"
        end
      end
    end
  end
end

game = TowersOfHanoi.new(4)
game.play
