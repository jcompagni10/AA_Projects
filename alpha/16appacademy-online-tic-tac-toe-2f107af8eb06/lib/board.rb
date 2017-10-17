require "byebug"
class Board
  attr_reader :grid

  def initialize(board = nil)
    if board
      @grid = board
    else
      @grid = Array.new(3) {Array.new(3)}
    end
  end


  def place_mark(pos, mark)
    grid[pos[0]][pos[1]] = mark
  end

  def empty?(pos)
    !grid[pos[0]][pos[1]]
  end

  def winner
    winning_combos= [[[0,0],[0,1],[0,2]],
                     [[1,0],[1,1],[1,2]],
                     [[2,0],[2,1],[2,2]],
                     [[0,0],[1,1],[2,2]],
                     [[0,2],[1,1],[2,0]]]
    [:X, :O].each do |mark|
      is_winner = winning_combos.any? do |combo|
        horiz = combo.all?{|square| grid[square[0]][square[1]] == mark}
        vert = combo.all?{|square| grid[square[1]][square[0]] == mark}
        horiz || vert
      end
      return mark if is_winner
    end
    nil
  end

  def over?
    is_over= (0..2).all? do |y|
      (0..2).all? {|x| !!grid[y][x]}
    end
    is_over || winner
  end


end
