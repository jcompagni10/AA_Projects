def reverser(&prc)
  str = prc.call
  str.split.map(&:reverse).join(" ")
end

def adder(val=1, &prc)
  val + prc.call
end

def repeater(val=1, &prc)
  val.times{ prc.call}
end
