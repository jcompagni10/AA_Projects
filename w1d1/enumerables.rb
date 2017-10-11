class Array
  def my_each(&prc)
    result = []
    i = 0
    while i < self.length
      prc.call(self[i])
      i += 1
    end
  end

  def my_select
    result = []
    self.my_each {|i| result << i if yield(i)}
    result
  end

  def my_reject
    result = []
    self.my_each {|i| result << i if !yield(i)}
    result
  end

  def my_any?
    self.my_each do |el|
      return true if yield(el)
    end
    false
  end

  def my_flatten
    result = []
    self.my_each do |el|
      if el.class != Array
        result << el
      else
        result += el.my_flatten
        p el.my_flatten
      end
    end
    result
  end

  def my_rotate(n = 1)
    result = self.dup
    if n > 0
      n.times do
        el = result.shift
        result.push(el)
      end
    else
      n.abs.times do
        el = result.pop
        result.unshift(el)
      end
    end
    result
  end

  def my_join(sep = "")
    result = ''
    self.each_with_index do |el, idx|
      if idx != self.length - 1
        result << el.to_s + sep
      else
        result << el.to_s
      end
    end
    result
  end

  def my_reverse
    result = []
    self.my_each { |el| result.unshift(el) }
    result
  end

  def my_zip(*args)
    result = []
    self.each_with_index do |el, i|
      temp = [el]
      args.each do |arg|
        temp << arg[i]
      end
      result << temp
    end
    result
  end

end
