def add (a, b)
  a +b
end

def subtract(a,b)
  a -b
end

def sum(arr)
  arr.reduce(0){|acc, val| acc + val }
end

def multiply(arr)
  mult = arr.reduce() do |acc, val|
    sum = 0
    val.times {sum += acc}
    sum
  end
  mult ||= 0
end

def power(base, exp)
  p = 1
  if exp >= 0
    exp.times {p = multiply([p,base])}
  else
    exp.abs.times {p /= base.to_f}
  end
  p
end

def factorial(n)
  return 0 if n == 0
  return 1 if n == 1
  (1..n).reduce(:*)
end
