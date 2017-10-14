class Board
  attr_reader :grid, :ships

  def initialize(grid = nil)
    if grid
      @ships = count_ships(grid)
      @grid = grid
    else
      @ships = 0
      @grid = Board.default_grid
    end
  end

  def [](pos)
    y, x = pos
    grid[y][x]
  end

  def count_ships(grid)
    ships = 0
    grid.each do |row|
      ships += row.count {|sq| sq == :s}
    end
    ships
  end

  def self.default_grid
    Array.new(10){Array.new(10)}
  end

  def count
    ships
  end

  def empty?(pos = nil)
    return ships == 0 if pos == nil
    y, x = pos
    grid[y][x] == nil
  end

  def full?
    grid.all? do |row|
      row.none? {|sq| sq == nil}
    end
  end

  def attack(pos)
    y, x = pos
    hit = grid[y][x] == :s
    grid[y][x] = :x
    hit
  end

  def place_random_ship
    sq_arr = grid.flatten
    open_sqs = sq_arr.each_index.select {|idx| sq_arr[idx] == nil}
    if open_sqs.length > 0
      sq = open_sqs.shuffle.first
      grid[sq/10][sq%10] = :s
      @ships += 1
    else
      raise "board is full"
    end
  end

  def won?
    grid.all? do |row|
      row.none? {|sq| sq == :s }
    end
  end



end
