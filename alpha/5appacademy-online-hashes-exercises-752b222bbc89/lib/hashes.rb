# EASY

# Define a method that, given a sentence, returns a hash of each of the words as
# keys with their lengths as values. Assume the argument lacks punctuation.
def word_lengths(str)
  word_hash = {}
  str.split.each{|word| word_hash[word] = word.length}
  word_hash
end

# Define a method that, given a hash with integers as values, returns the key
# with the largest value.
def greatest_key_by_val(hash)
  hash.sort_by{|k,v| v}[-1][0]
end

# Define a method that accepts two hashes as arguments: an older inventory and a
# newer one. The method should update keys in the older inventory with values
# from the newer one as well as add new key-value pairs to the older inventory.
# The method should return the older inventory as a result. march = {rubies: 10,
# emeralds: 14, diamonds: 2} april = {emeralds: 27, moonstones: 5}
# update_inventory(march, april) => {rubies: 10, emeralds: 27, diamonds: 2,
# moonstones: 5}
def update_inventory(older, newer)
  newer.each do |k, v|
    older[k] = v
  end
  older
end

# Define a method that, given a word, returns a hash with the letters in the
# word as keys and the frequencies of the letters as values.
def letter_counts(word)
  freq = Hash.new(0)
  word.chars.each{|ch| freq[ch] += 1 }
  freq
end

# MEDIUM

# Define a method that, given an array, returns that array without duplicates.
# Use a hash! Don't use the uniq method.
def my_uniq(arr)
  vals = {}
  arr.each{|val| vals[val] = true }
  vals.keys
end

# Define a method that, given an array of numbers, returns a hash with "even"
# and "odd" as keys and the frequency of each parity as values.
def evens_and_odds(numbers)
  freq = {even: 0, odd: 0}
  numbers.each do |n|
    if n.odd?
      freq[:odd] += 1
    else
      freq[:even] += 1
    end
  end
  freq
end

# Define a method that, given a string, returns the most common vowel. If
# there's a tie, return the vowel that occurs earlier in the alphabet. Assume
# all letters are lower case.
def most_common_vowel(string)
  vowels = "aeiou"
  freq = Hash.new(0)
  string.chars.each do |ch|
    freq[ch] += 1
  end
  freq.sort_by{|k, v| v }[-1][0]
end

# HARD

# Define a method that, given a hash with keys as student names and values as
# their birthday months (numerically, e.g., 1 corresponds to January), returns
# every combination of students whose birthdays fall in the second half of the
# year (months 7-12). students_with_birthdays = { "Asher" => 6, "Bertie" => 11,
# "Dottie" => 8, "Warren" => 9 }
# fall_and_winter_birthdays(students_with_birthdays) => [ ["Bertie", "Dottie"],
# ["Bertie", "Warren"], ["Dottie", "Warren"] ]
def fall_and_winter_birthdays(students)
  set = students.select{|student, bday| bday > 6 }.keys
  combs = []
  set.each_with_index do|student1, idx|
    set[idx+1..-1].each{|student2| combs << [student1, student2]}
  end
  combs
end

# Define a method that, given an array of specimens, returns the biodiversity
# index as defined by the following formula: number_of_species**2 *
# smallest_population_size / largest_population_size biodiversity_index(["cat",
# "cat", "cat"]) => 1 biodiversity_index(["cat", "leopard-spotted ferret",
# "dog"]) => 9
def biodiversity_index(specimens)
  freq = Hash.new(0)
  specimens.each{|spec| freq[spec] += 1 }
  freq.length ** 2 * freq.values.min/freq.values.max

end

# Define a method that, given the string of a respectable business sign, returns
# a boolean indicating whether pranksters can make a given vandalized string
# using the available letters. Ignore capitalization and punctuation.
# can_tweak_sign("We're having a yellow ferret sale for a good cause over at the
# pet shop!", "Leopard ferrets forever yo") => true
def get_letter_freq(str)
  freq = Hash.new(0)
  str.chars.each{|ch| freq[ch] += 1}
  freq
end

def can_tweak_sign?(normal_sign, vandalized_sign)
  normal_sign.downcase!
  vandalized_sign.downcase!
  normal = get_letter_freq(normal_sign)
  vandal = get_letter_freq(vandalized_sign)
  vandal.all?{|letter, val| normal[letter] >= val}
end
