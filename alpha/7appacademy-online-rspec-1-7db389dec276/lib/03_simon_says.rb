def echo(str)
  str
end

def shout(str)
  str.upcase
end

def repeat(str, n=2)
  str + " #{str}" * (n-1)
end

def start_of_word(str, n)
  str[0..n-1]
end

def first_word(str)
  str.split.first
end

def titleize(str)
  littles = %w[the is over by a and]
  str.split.map.with_index do |word, idx|
    if !littles.include?(word) || idx == 0
      word.capitalize
    else
      word
    end
  end
  .join(' ')
end
