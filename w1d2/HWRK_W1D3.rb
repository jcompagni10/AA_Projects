def sum_to(n)
  return nil if n < 0
  return n if n <= 1
  n + sum_to(n-1)
end

def add_numbers(arr)
  return arr.last if arr.length <= 1
  arr[0] + add_numbers(arr.drop(1))
end

def factorial(n)
  return 1 if n <= 1
  n * factorial(n-1)
end

def gamma_fnc(n)
  return nil if n < 1
  factorial(n-1)
end

def ice_cream_shop(flavors, favorite)
  return false if flavors.empty?
  return true if flavors.pop == favorite
  ice_cream_shop(flavors, favorite)
end

def reverse(str)
  return str if str.length <= 1
  reverse(str[1..-1]) + str[0]
end
