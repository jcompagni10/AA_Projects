list = [ 0, 3, 5, 4, -5, -50, 10, 1, 90 ]

def my_min_1(arr)
  arr.each do |el1|
    smallest = true
    arr.each do |el2|
      smallest = false if el2 <= el1
    end
    return el1 if smallest
  end
end

def my_min_2(arr)
  smallest = arr[0]
  arr.each do |el1|
    smallest = el1 if el1 < smallest
  end
  smallest
end

def sub_arrays(arr)
  i = 0
  sub_arrs= []
  while i < arr.length
    j = i
    while j < arr.length
      sub_arrs << arr[i..j]
      j+=1
    end
    i += 1
  end
  sub_arrs
end

def sum_subs(arr)
  arr.map{|a| a.inject(&:+)}
end

def contig_sub_sum(arr)
  subs = sum_subs(sub_arrays(arr))
  subs.max
end

def global_min_max(arr)
  min = arr[0]
  min_idx = 0
  max = arr[0]
  max_idx = 0
  working = 0
  arr.each_with_index do |el, idx|
    working += el
    if working < min
      min = working
      min_idx = idx
    end
    if working > max
      max = working
      max_idx = idx
    end
  end
  [min_idx, min, max_idx, max]
end

def contig_sub_sum2(arr)
  min_idx, min_val, max_idx, max_val = global_min_max(arr)
  if min_idx < max_idx
    max_val - min_val
  else
    _, min_val, _, max_val = global_min_max(arr[0..max_idx])
    left = max_val- min_val

    _, min_val, _, max_val = global_min_max(arr[min_idx..-1])
    right = max_val- min_val
    [left,right].max
  end
end

list2 = [-1,2,3,4]
# puts my_min_2(list)
# puts contig_sub_sum(list)
puts contig_sub_sum2(list)
