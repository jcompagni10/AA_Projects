class Timer
  attr_accessor :seconds

  def initialize(seconds = 0)
    @seconds = seconds
  end

  def minutes
    (@seconds / 60).floor
  end

  def hours
    (minutes / 60).floor
  end

  def time_string
    seconds = @seconds
    "#{padded(hours)}:#{padded(minutes%60)}:#{padded(seconds%60)}"
  end

  def padded(n)
    if n == 0
      return "00"
    elsif n < 10
      return "0#{n}"
    else
      n.to_s
    end

  end


end
