require 'byebug'

def range(start, finish)
  return [] if finish <= start
  [start] + range(start+1, finish)
end

def recursive_sum(arr)
  return 0 if arr.empty?
  arr[0] + recursive_sum(arr[1..-1])
end

def iterative_sum(arr)
  arr.inject(0,:+)
end

def exp1(base, n)
  return "you want a root fxn" if n < 0
  return 1 if n == 0
  base * exp1(base, n-1)
end

def exp2(base, n)
  return 1 if n == 0
  return base if n ==1
  if n.even?
    temp = exp2(base, n/2)
    temp * temp
  else
    temp = exp2(base, (n-1)/2 )
    base* temp * temp
  end
end

def deep_dup(arr)
  return arr if arr.class != Array

  arr.map do |el|
    deep_dup(el)
  end
end

def fib(n)
  return "nah bro" if n < 0
  return 1 if n <=1
  fib(n-1) + fib(n-2)
end

def array_subsets(arr)
  return [arr] if arr.empty?

  results = [arr]

  arr.combination(arr.length - 1) do |sub_arr|
    results += array_subsets(sub_arr)
  end

  results.uniq
end

def permutations(arr)
  # debugger
  if arr.length <= 1
    return [arr]
  end

  results = []

  (0...arr.length).each do |idx|
    rotated = arr.rotate(idx)
    permutations(rotated[1..-1]).each do |sub_arr|
      results << [rotated[0]] + sub_arr
    end
  end

  results
end

def binary_search(arr, target)
  return nil if arr.empty?
  return arr[0] == target ? 0 : nil if arr.length == 1

  middle_idx = arr.length / 2
  middle_val = arr[middle_idx]

  if middle_val == target
    middle_idx
  else
    left = arr[0...middle_idx]
    right = arr[middle_idx+1..-1]
    if middle_val > target
      return binary_search(left, target)
    else
      right_val = binary_search(right, target)
      if right_val
        return left.length + 1 + right_val
      else
        return right_val
      end
    end
  end
end

def merge_sort(arr)
  return arr if arr.length <= 1

  middle_idx = arr.length / 2
  left = arr[0...middle_idx]
  right = arr[middle_idx..-1]

  combine(merge_sort(left), merge_sort(right))
end

def combine(left_arr, right_arr)
  result = []
  until left_arr.empty? || right_arr.empty?
    if left_arr[0] < right_arr[0]
      result << left_arr.shift
    else
      result << right_arr.shift
    end
  end

  result + left_arr + right_arr
end

def greedy_make_change(target, coins = [25, 10, 5, 1])
  return [target] if coins.include?(target)

  if target / coins[0] > 0
    target -= coins[0]
    greedy_make_change(target, coins).unshift(coins[0])
  else
    greedy_make_change(target, coins[1..-1])
  end
end

def make_better_change(my_target, coins = [25, 10, 5, 1])
  combos = find_change_combos(my_target, coins)
  combos.sort_by(&:length).first
end

def find_change_combos(target, coins = [25, 10, 5, 1])
  return [[target]] if coins.include?(target)
  combinations = []
  coins.each do |coin|
    combination = []
    if coin < target
      combination << coin
      find_change_combos(target - coin, coins).each do |combo|
        combinations << combination + combo
      end
    end
  end
  combinations
end
