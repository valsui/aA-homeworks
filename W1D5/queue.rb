class Queue

  def initialize
    @queue = []
  end

  def enqueue(el)
    @queue.push(el)
  end

  def dequeue
    @queue.shift
    @queue
  end

  def show
    @queue
  end
end
