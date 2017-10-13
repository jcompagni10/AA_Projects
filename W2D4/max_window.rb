def naieve(arr, window)
  current_max = chunk_range(arr[0...window])
  arr.each_cons(window) do |chunk|
    cur_sum = chunk_range(chunk)
    current_max = cur_sum if cur_sum > current_max
  end
  current_max
end

def chunk_range(arr)
  arr.max - arr.min
end

p naieve([1, 0, 2, 5, 4, 8], 2) == 4 # 4, 8
p naieve([1, 0, 2, 5, 4, 8], 3) == 5 # 0, 2, 5
p naieve([1, 0, 2, 5, 4, 8], 4) == 6 # 2, 5, 4, 8
p naieve([1, 3, 2, 5, 4, 8], 5) == 6 # 3, 2, 5, 4, 8

class MyStack
  def initialize
    @store = []
  end

  def pop
    @store.pop
  end

  def push
    @store.push
  end

  def peek
    @store.last
  end

  def size
    @store.length
  end

  def empty?
    @store.empty?
  end
end

class MyStackQueue
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

  def size
    @enqueue.size + @dequeue.size
  end

  def empty?
    @enqueue.empty? && @dequeue.empty?
  end

end
