class Dictionary
  attr_accessor :entries

  def initialize
    @entries = {}
  end

  def add (entry)
    if entry.class == String
      @entries[entry] = nil
    else
      @entries[entry.keys.first] = entry.values.first
    end
  end

  def keywords
    @entries.keys.sort
  end

  def include?(word)
    keywords.include?(word)
  end

  def find(str)
    matches = keywords.select{|word| word.include?(str) }
    if matches.empty?
      return {}
    else
      return_hash = {}
      matches.each{|word| return_hash[word] = @entries[word]}
    end
    return_hash
  end

  def printable
    output = ""
    sorted_keys = entries.keys.sort
    sorted_keys.each_with_index do |key, idx|
      output += "[#{key}] \"#{@entries[key]}\""
      output +="\n" unless idx == sorted_keys.length-1
    end
    output
  end

end
