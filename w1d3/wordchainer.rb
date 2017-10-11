require "set"
require 'byebug'

class WordChainer

  def initialize(dictionary = "dictionary.txt")
    words = File.readlines(dictionary).map(&:chomp)
    @dictionary = Set.new(words)
  end

  def adjacent_words(word)
    sub_dictionary = @dictionary.select do |dict_word|
      word.length == dict_word.length
    end

    valid_words = Set.new

    word.length.times do |idx|
      test_word = word.dup
      test_word[idx] = '.'
      regex = Regexp.new(test_word)
      valid_words += sub_dictionary.select { |wrd| regex.match(wrd) }
    end

    valid_words.delete(word)
  end

  def run(source, target)
    @current_words = Set.new([source])
    @all_seen_words = {}
    @all_seen_words[source] = nil

    until @current_words.empty? || @all_seen_words.include?(target)
      all_current_words = Set.new

      @current_words.each do |word|
        all_current_words += explore_current_words(word)
      end

      @current_words = all_current_words
    end

    p build_path(target)
  end

  def explore_current_words(word)
    new_current_words = Set.new

    adjacent_words(word).each do |adj_word|
      next if @all_seen_words.include?(adj_word)
      new_current_words << adj_word
      @all_seen_words[adj_word] = word
    end

    new_current_words.each do |key|
      p "#{key} => #{@all_seen_words[key]}"
    end
  end

  def build_path(target)
    return [target] if @all_seen_words[target].nil?

    [target] + build_path(@all_seen_words[target])
  end

end


if __FILE__ == $0
  wc = WordChainer.new
  wc.run("abate", "table")
end
