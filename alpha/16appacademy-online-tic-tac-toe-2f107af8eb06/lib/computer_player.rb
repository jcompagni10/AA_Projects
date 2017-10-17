require "byebug"

class ComputerPlayer
  attr_reader :name, :mark, :board

  def initialize(name)
    @name = name
  end

  def display(board)
    @board = board
  end

  def mark=(mark)
    @mark = mark
  end

  def get_move
    arr = board.grid.flatten
    available = arr.each_index.select { |idx| arr[idx] == nil}
    winner = nil
    op_mark = mark == :X ? :O : :X
    block = nil
    available.each do |move|
      move = [move/3, move%3]
      board.place_mark(move, mark)
      winner = move if board.winner == mark
      board.place_mark(move, op_mark)
      block = move if board.winner == op_mark
      board.place_mark(move, nil)
    end
    winner || (block || [available.first/3, available.first%3])
  end

end
