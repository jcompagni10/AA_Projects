class RPNCalculator < Array

  def value
    self[-1]
  end

  def operation(&prc)
    len = self.length
    raise "calculator is empty" if len < 2
    self[len-2] = yield(self[len-2], self.pop)
  end

  def plus
    operation {|a,b| a+b}
  end

  def minus
    operation {|a,b| a -b}
  end

  def times
    operation {|a,b| a *b}
  end

  def divide
    operation {|a,b| a.to_f / b}
  end

  def tokens(str)
    tokens = str.split
    operations = %W[+ - / *]
    tokens.map! do |token|
      if operations.include?(token)
        token.to_sym
      else
        token.to_i
      end
    end
    tokens
  end

  def evaluate(str)
    tokens = tokens(str)
    tokens.each do |token|
      if token.class == Fixnum
        push(token)
      elsif token == :+
        plus
      elsif token == :-
        minus
      elsif token == :*
        times
      elsif token == :/
        divide
      end
    end
    return value
  end


end
