# Back in the good old days, you used to be able to write a darn near
# uncrackable code by simply taking each letter of a message and incrementing it
# by a fixed number, so "abc" by 2 would look like "cde", wrapping around back
# to "a" when you pass "z".  Write a function, `caesar_cipher(str, shift)` which
# will take a message and an increment amount and outputs the encoded message.
# Assume lowercase and no punctuation. Preserve spaces.
#
# To get an array of letters "a" to "z", you may use `("a".."z").to_a`. To find
# the position of a letter in the array, you may use `Array#find_index`.
def ceaser_word(str, shift)
  alphabet = ('a'..'z').to_a
  arr = str.split('')
  result = ""
  arr.each do |letter|
    pos = alphabet.index(letter) + shift
    result += alphabet[pos%26]
  end
  result
end

def caesar_cipher(str, shift)
  words = str.split(' ')
  words.map!{ |word| ceaser_word(word.to_s,shift)}
  words.join(' ')
end

# Write a method, `digital_root(num)`. It should Sum the digits of a positive
# integer. If it is greater than 10, sum the digits of the resulting number.
# Keep repeating until there is only one digit in the result, called the
# "digital root". **Do not use string conversion within your method.**
#
# You may wish to use a helper function, `digital_root_step(num)` which performs
# one step of the process.

# Example:
# digital_root(4322) => 2
# (4 + 3 + 2 + 2) => 11 => (1 + 1) => 2
def digital_helper(num)
  result = 0
  while num >= 10
    result += num % 10
    num = num/10
  end
  result + num
end

def digital_root(num)
  while num > 10
    num = digital_helper(num)
  end
  num
end

# Jumble sort takes a string and an alphabet. It returns a copy of the string
# with the letters re-ordered according to their positions in the alphabet. If
# no alphabet is passed in, it defaults to normal alphabetical order (a-z).

# Example:
# jumble_sort("hello") => "ehllo"
# jumble_sort("hello", ['o', 'l', 'h', 'e']) => 'ollhe'

def jumble_sort(str, alphabet = nil)
  arr = str.split('')
  if alphabet.nil?
    arr.sort.join
  else
    arr.sort{|i, j| alphabet.index(i) <=> alphabet.index(j)}.join
  end

end

class Array
  # Write a method, `Array#two_sum`, that finds all pairs of positions where the
  # elements at those positions sum to zero.

  # NB: ordering matters. I want each of the pairs to be sorted smaller index
  # before bigger index. I want the array of pairs to be sorted
  # "dictionary-wise":
  #   [0, 2] before [1, 2] (smaller first elements come first)
  #   [0, 1] before [0, 2] (then smaller second elements come first)

  def two_sum
    result = []
    self.each_with_index do |val1, idx1|
      self.drop(idx1+1).each_with_index do |val2, idx2|
        result << [idx1, idx2+idx1+1] if val1 + val2 == 0
      end
    end
    result
  end


end

class String
  # Returns an array of all the subwords of the string that appear in the
  # dictionary argument. The method does NOT return any duplicates.
  def get_subwords(word)
    words = []
    len = word.length
    (0..len-2).each do |i|
      (i..len-1).each {|j| words << word[i..j]}
    end
    words.uniq!
  end


  def real_words_in_string(dictionary)
    words = get_subwords(self)
    words.select {|word| dictionary.include?(word)}
  end
end

# Write a method that returns the factors of a number in ascending order.

def factors(num)
  (1..num).select{|i| num % i == 0 }
end
