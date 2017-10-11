# EASY

# Return the argument with all its lowercase characters removed.
def destructive_uppercase(str)
  my_str = ""
  str.chars{|ch| my_str += ch if ch.upcase == ch}
  my_str
end

# Return the middle character of a string. Return the middle two characters if
# the word is of even length, e.g. middle_substring("middle") => "dd",
# middle_substring("mid") => "i"
def middle_substring(str)
  length = str.length
  if length.odd?
    str[length/2]
  else
    str[length/2-1,2]
  end
end

# Return the number of vowels in a string.
VOWELS = %w(a e i o u)
def num_vowels(str)
  str.count("AEIOUaeiou")
end

# Return the factoral of the argument (num). A number's factorial is the product
# of all whole numbers between 1 and the number itself. Assume the argument will
# be > 0.
def factorial(num)
  product = num
  (1...num).each{|n| product *= n}
  product
end


# MEDIUM

# Write your own version of the join method. separator = "" ensures that the
# default seperator is an empty string.
def my_join(arr, separator = "")
  if arr.empty?
    return ""
  else
    new_str = ''
    arr[0..-2].each{|n| new_str+= (n+separator)}
    new_str + arr[-1]
  end
end

# Write a method that converts its argument to weirdcase, where every odd
# character is lowercase and every even is uppercase, e.g.
# weirdcase("weirdcase") => "wEiRdCaSe"
def weirdcase(str)
  is_upcase = false
  new_str = ''
  str.chars.each do |ch|
    if is_upcase
      new_str += ch.upcase
    else
      new_str += ch.downcase
    end
    is_upcase = !is_upcase
  end
  new_str
end

# Reverse all words of five more more letters in a string. Return the resulting
# string, e.g., reverse_five("Looks like my luck has reversed") => "skooL like
# my luck has desrever")
def reverse_five(str)
  arr = str.split
  new_str = []
  arr.each do |word|
    if word.length >= 5
      word.reverse!
    end
    new_str.push(word)
  end
  new_str.join(" ")
end

# Return an array of integers from 1 to n (inclusive), except for each multiple
# of 3 replace the integer with "fizz", for each multiple of 5 replace the
# integer with "buzz", and for each multiple of both 3 and 5, replace the
# integer with "fizzbuzz".
def fizzbuzz(max)
  arr =[]
  (1..max).each do |n|
    if n % 3 != 0 && n % 5 != 0
      arr.push n
    else
      val = ''
      if n % 3 == 0
        val = "fizz"
      end
      if n % 5 == 0
        val += "buzz"
      end
      arr.push val
    end
  end
  arr
end


# HARD

# Write a method that returns a new array containing all the elements of the
# original array in reverse order.
def my_reverse(arr)
  idx = arr.length - 1
  rev = []
  while idx >= 0
    rev.push(arr[idx])
    idx -= 1
  end
  rev
end

# Write a method that returns a boolean indicating whether the argument is
# prime.
def prime?(num)
  return false if num < 2
  (2..num/2).each{ |n| return false if num % n == 0 }
  return true
end

# Write a method that returns a sorted array of the factors of its argument.
def factors(num)
  facs = [1]
  (2..num/2).each{|n| facs.push(n) if num % n == 0 }
  facs.push(num)
end

# Write a method that returns a sorted array of the prime factors of its argument.
def prime_factors(num)
  facs = factors(num)
  p_facs = []
  facs.each{|n| p_facs.push(n) if prime?(n)}
  p_facs
end



# Write a method that returns the number of prime factors of its argument.

def num_prime_factors(num)
  prime_factors(num).length
end


# EXPERT

# Return the one integer in an array that is even or odd while the rest are of
# opposite parity, e.g. oddball([1,2,3]) => 2, oddball([2,4,5,6] => 5)
def oddball(arr)
  a, b, c = arr
  if a %2  == b %2
    expected = a %2
    arr.drop(2).each{|n| return n if n != a}
  elsif a%2  == c %2
    return b
  else
    return a
  end
end
