class Temperature
  def initialize (hash)
    if hash.keys[0] == :f
      @temp = to_celsius(hash.values[0])
    else
      @temp = hash.values[0]
    end
  end

  def in_fahrenheit
    to_fahrenheit(@temp)
  end

  def in_celsius
    @temp
  end

  def to_celsius(temp)
    (temp-32)*5/9.0
  end

  def self.from_fahrenheit(temp)
    return Temperature.new({:f => temp})
  end

  def self.from_celsius(temp)
    return Temperature.new({:c => temp})
  end

  def to_fahrenheit(temp)
    temp / (5/9.0)+32
  end

end

class Celsius < Temperature
  def initialize(temp)
    @temp = temp
  end
end

class Fahrenheit < Temperature
  def initialize(temp)
      @temp = to_celsius(temp)
  end
end
