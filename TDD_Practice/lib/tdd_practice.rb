class Array
  #remove dups: array => array
  def my_uniq

    all_vals = Hash.new(0)

    each do |el|
      all_vals[el] = true
    end
    all_vals.keys
  end

  def two_sum
    two_sums = []
    (0...length).each do |start_idx|
      (start_idx+1...length).each do |end_idx|
        if self[start_idx] + self[end_idx] == 0
          two_sums << [start_idx, end_idx]
        end
      end
    end
    two_sums
  end

  def my_transpose
    transposed = Array.new(length) { [] }

    (0...length).each do |i|
      (0...length).each do |j|
        val = self[i][j]
        transposed[j][i] = val if val
      end
    end
    transposed
  end

  def stock_picker
    return nil if length <= 1
    start_day = 0
    end_day = 1
    max_gain = self[end_day]-self[start_day]
    (1...length).each do |start_idx|
      (start_idx+1...length).each do |end_idx|
        possible_gain = self[end_idx] - self[start_idx]
        if possible_gain > max_gain
          max_gain = possible_gain
          start_day = start_idx
          end_day = end_idx
        end
      end
    end
    [start_day, end_day]
  end
end
