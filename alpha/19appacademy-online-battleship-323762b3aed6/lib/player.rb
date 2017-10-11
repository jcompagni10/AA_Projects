class HumanPlayer

  def initialize
  end

  def get_play
    puts "Where would you like to attack (ex. 3,3)? "
    move = gets.chomp.split(',')
    move.map!(&:to_i)
  end

end
