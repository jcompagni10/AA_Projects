# I/O Exercises
#
# * Write a `guessing_game` method. The computer should choose a number between
#   1 and 100. Prompt the user to `guess a number`. Each time through a play loop,
#   get a guess from the user. Print the number guessed and whether it was `too
#   high` or `too low`. Track the number of guesses the player takes. When the
#   player guesses the number, print out what the number was and how many guesses
#   the player needed.
# * Write a program that prompts the user for a file name, reads that file,
#   shuffles the lines, and saves it to the file "{input_name}-shuffled.txt". You
#   could create a random number using the Random class, or you could use the
#   `shuffle` method in array.

def guessing_game
  num = rand(99)+1
  guesses = 0
  correct = false

  until correct
    print "guess a number? "
    guess = gets.chomp.to_i
    guesses += 1
    puts guess
    if guess > num
      puts "too high"
    elsif guess < num
      puts "too low"
    elsif guess == num
      correct = true
      puts "CORRECT!! It took you #{guesses} guesses"
    end
  end
end

def shuffle_file
  print "input a file name? "
  input= gets.chomp
  lines = File.readlines(input)
  lines.shuffle!
  new_file =input.sub(".","_shuffled.")
  File.open(new_file, "w") do |f|
    lines.each{|line| f.puts line}
  end
end

shuffle_file
