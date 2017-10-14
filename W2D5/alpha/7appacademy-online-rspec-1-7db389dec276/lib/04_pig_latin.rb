


def translate(str)
  str.split.map do |word|
    is_capitalized = word[0].upcase == word[0]
    punctuation = "!?.,:;"
    if punctuation.include?(word[-1])
      punctuation = word.slice!(-1)
      puncuated = true
    end
    trans = translate_word(word.downcase)
    trans = trans.capitalize if is_capitalized
    trans += punctuation if puncuated
    trans
  end
  .join(' ')
end

def translate_word(str)
  vowels ="aeiou"
  if !vowels.include?(str[0])
    idx = 0
    while (!vowels.include?(str[idx]))
      idx +=1 if str[idx] == 'q' && str[idx+1] == 'u'
      idx += 1
    end
    str.split('').rotate(idx).join+"ay"
  else
    str+"ay"
  end
end
