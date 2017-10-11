class Fixnum
  NUMBERS = %W[zero one two three four five six seven eight nine ten eleven twelve thirteen fourteen fifteen sixteen seventeen eighteen nineteen]
  TENSPLACE = %W["" ten twenty thirty forty fifty sixty seventy eighty ninety]
  PLACES =  %W["" thousand million billion trillion]

  def hundredGroup(digits)
    section = []
    digits.each_with_index do |d, idx|
      if d == 0
        next
      elsif idx == 2
        section.push(NUMBERS[d])
      elsif idx == 1 && d < 2
        section.push(NUMBERS[d*10+digits[2]])
        break
      elsif idx == 1
        section.push(TENSPLACE[d])
      elsif idx == 0
        section.push(NUMBERS[d]) << "hundred"
      end
    end
    section.join(" ")
  end


  def in_words
    return "zero" if self == 0
    digits = to_s.split('')
    digits = digits.map!{|n| n.to_i}
    og_len = digits.length
    (3-og_len%3).times {digits.unshift(0)}
    len = digits.length/3
    number= []
    digits.each_slice(3).with_index do |slice, idx|
      section = hundredGroup(slice)
      if section == ""
        next
      else
        number.push(section)
        number.push(PLACES[len-idx-1]) unless idx == len -1
      end
    end
    number.join(" ")
  end
end
