

def perms(arr)
  return [arr] if arr.length <= 1
  el = arr.pop
  all_perms = perms(arr)
  return_val = []
  all_perms.each do |perm|
    (0..perm.length).each do |idx|
      return_val << perm.take(idx) + [el] + perm.drop(idx)
    end
  end
  return_val
end


def first_anagram?(str1, str2)
  all_perms = perms(str2.split(""))
  all_perms.include?(str1.split(""))
end

def second_anagram?(str1, str2)
  str2 = str2.split('')
  str1 = str1.split('')
  len = str1.length
  len.times do |idx|
    ch = str1.pop
    index = str2.index(ch)
    return false unless index
    str2.delete_at(index)
  end
  return true if str2.empty?
  false
end

def third_anagram?(str1, str2)
  str2 = str2.split('')
  str1 = str1.split('')
  str1.sort == str2.sort
end

def fourth_anagram?(str1, str2)
  return false if str1.length != str2.length
  freq = Hash.new(0)
  (0...str1.length).each do |idx|
    ch1 = str1[idx]
    ch2 = str2[idx]
    freq[ch1] += 1
    freq[ch2] -= 1
  end
  freq.all? {|_, v| v == 0}
end



def bad_two_sum?(arr, target_sum)

  arr[0..-2].each_with_index do |el1, idx|
    arr[idx+1..-1].each do |el2|
      return true if el1 + el2 == target_sum
    end
  end
  false
end

def maybe_two_sum?(arr, target)
  sorted = arr.sort
  left = sorted.shift
  right = sorted.pop
  until sorted.empty?
    return true if left + right == target
    if left + right > target
      right = sorted.pop
    else
      left = sorted.shift
    end
  end
  return true if left + right == target
  false
end



def hash_two_sum?(arr, target)
  hash = Hash.new(false)
  arr.each do |el|
    if hash[el]
      return true
    else
      hash[target-el] = true
    end
  end
  false
end







#
