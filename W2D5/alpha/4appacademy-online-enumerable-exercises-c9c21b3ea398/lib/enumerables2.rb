require 'byebug'

# EASY

# Define a method that returns the sum of all the elements in its argument (an
# array of numbers).
def array_sum(arr)
  sum = arr.reduce(:+);
  sum ||= 0
end

# Define a method that returns a boolean indicating whether substring is a
# substring of each string in the long_strings array.
# Hint: you may want a sub_tring? helper method
def in_all_strings?(long_strings, substring)
  long_strings.all?{|str| str.include?(substring)}
end

# Define a method that accepts a string of lower case words (no punctuation) and
# returns an array of letters that occur more than once, sorted alphabetically.
def non_unique_letters(string)
  dups = []
  chars = string.chars
  chars.delete(' ')
    chars.each  do |ch|
    if string.count(ch) > 1
      dups << ch
      chars.delete(ch)
    end
  end
  dups
end

# Define a method that returns an array of the longest two words (in order) in
# the method's argument. Ignore punctuation!
def longest_two_words(string)
  string.delete(".!?,")
  words = string.split
  words.sort_by!(&:length)
  words.reverse[0..1]
end

# MEDIUM

# Define a method that takes a string of lower-case letters and returns an array
# of all the letters that do not occur in the method's argument.
def missing_letters(string)
  alpha = "abcdefghijklmnopqrstuvwxyz"
  alpha.chars.each.reject{|ch| string.include?(ch)}
end

# Define a method that accepts two years and returns an array of the years
# within that range (inclusive) that have no repeated digits. Hint: helper
# method?
def no_repeat_years(first_yr, last_yr)
  (first_yr..last_yr).select{|yr| not_repeat_year? yr}
end

def not_repeat_year?(year)
  str = year.to_s.split('')
  str == str.uniq
end

# HARD

# Define a method that, given an array of songs at the top of the charts,
# returns the songs that only stayed on the chart for a week at a time. Each
# element corresponds to a song at the top of the charts for one particular
# week. Songs CAN reappear on the chart, but if they don't appear in consecutive
# weeks, they're "one-week wonders." Suggested strategy: find the songs that
# appear multiple times in a row and remove them. You may wish to write a helper
# method no_repeats?
def one_week_wonders(songs)
  songs[1..-1].each_with_index do |song, idx|
    if song == songs[idx-1]
      songs.delete(song)
    end
  end
  songs.uniq
end
# Define a method that, given a string of words, returns the word that has the
# letter "c" closest to the end of it. If there's a tie, return the earlier
# word. Ignore punctuation. If there's no "c", return an empty string. You may
# wish to write the helper methods c_distance and remove_punctuation.

def for_cs_sake(string)
  if string.include?('c')
    string.delete!('?.!,')
    words = string.split
    words = words.select{|word| word.include?("c")}
    words.reduce do |closest_c, word|
      if closest_c.reverse.index('c') < word.index('c')
        closest_c
      else
        word
      end
    end
  else
    ""
  end
end


# Define a method that, given an array of numbers, returns a nested array of
# two-element arrays that each contain the start and end indices of whenever a
# number appears multiple times in a row. repeated_number_ranges([1, 1, 2]) =>
# [[0, 1]] repeated_number_ranges([1, 2, 3, 3, 4, 4, 4]) => [[2, 3], [4, 6]]

def repeated_number_ranges(arr)
  ranges = []
  strt_group = nil
  arr.each_with_index do |val, idx|
    next_val = arr[idx+1]
    if strt_group
      if val != next_val
        ranges << [strt_group, idx]
        strt_group = nil
      end
    elsif val == next_val
      strt_group = idx
    end
  end
  ranges
end
