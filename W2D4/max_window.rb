class MyStack
  def initialize
    @store = []
  end

  def pop
    @store.pop[:val]

  end

  def push(el)
    previous = peek
    if previous.nil?
      hash = {val: el, min: el, max: el}
    else
      hash = {val: el, min: [previous[:min], el].min, max: [previous[:max], el].max }
    end
    @store.push(hash)
  end

  def peek
    @store.last
  end

  def max
    peek[:max] unless peek.nil?
  end

  def min
    peek[:min] unless peek.nil?
  end

  def size
    @store.length
  end

  def empty?
    @store.empty?
  end
end

class MMStackQueue

  def initialize()
    @enqueue = MyStack.new
    @dequeue = MyStack.new
  end

  def enqueue(el)
    # in
    @enqueue.push(el)
  end

  def dequeue
    if @dequeue.empty?
      flop_over
    end
    @dequeue.pop
  end

  def flop_over
    until @enqueue.empty?
      @dequeue.push(@enqueue.pop)
    end
  end

  def min
    if @enqueue.min && @dequeue.min
      [@enqueue.min, @dequeue.min].min
    else
      @enqueue.min || @dequeue.min
    end
  end

  def max

    if @enqueue.max && @dequeue.max
      [@enqueue.max, @dequeue.max].max
    else
      @enqueue.max || @dequeue.max
    end

  end


  def size
    @enqueue.size + @dequeue.size
  end

  def empty?
    @enqueue.empty? && @dequeue.empty?
  end

end



def naieve(arr, window)
  current_max = chunk_range(arr[0...window])
  arr.each_cons(window) do |chunk|
    cur_sum = chunk_range(chunk)
    current_max = cur_sum if cur_sum > current_max
  end
  current_max
end

def max_windowed_range(arr, window)

  mmsq = MMStackQueue.new

  window.times do |i|
    mmsq.enqueue(arr[i])
  end
  max_range = mmsq.max - mmsq.min

  arr[window..-1].each do |el|
    mmsq.dequeue
    mmsq.enqueue(el)
    range = mmsq.max - mmsq.min
    max_range = range if range > max_range
  end
  max_range
end

def chunk_range(arr)
  arr.max - arr.min
end

p max_windowed_range([1, 0, 2, 5, 4, 8], 2) #== 4 # 4, 8
p max_windowed_range([1, 0, 2, 5, 4, 8], 3) #== 5 # 0, 2, 5
p max_windowed_range([1, 0, 2, 5, 4, 8], 4) #== 6 # 2, 5, 4, 8
p max_windowed_range([1, 3, 2, 5, 4, 8], 5) #== 6 # 3, 2, 5, 4, 8
