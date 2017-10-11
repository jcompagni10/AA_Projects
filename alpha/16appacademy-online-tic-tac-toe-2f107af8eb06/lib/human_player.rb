class HumanPlayer
  attr_reader :name

  def initialize(name)
    @name = name
  end

  def get_move
    puts "Where do you want to play? (ex. 0, 0) "
    move = gets.chomp.split(", ")
    move.map!(&:to_i)

    if move.length != 2 || !@board.empty?(move)
      puts "invalid move"
      get_move
    else
      move
    end
  end


  def display(board)
    @board = board
    grid = board.grid
    grid.each do |line|
      puts line.map{|n| n||= " "}.join("|")
    end
  end
end
