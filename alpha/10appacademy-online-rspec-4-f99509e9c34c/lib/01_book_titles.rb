class Book
  attr_reader :title
  SMALL_WORDS = ["is", "of", "the", "for", "with", "and", "in", "to", "a", "an"]

  def title=title
    title_arr = title.split.map.with_index do |word, idx|
      word.downcase!
      word.capitalize! unless SMALL_WORDS.include?(word) && idx !=0
      word
    end
    @title = title_arr.join(" ")
  end
end
