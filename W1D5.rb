class Stack

  def initialize
    @ivar = []
  end

  def add(el)
    ivar << el
  end

  def remove
    ivar.pop
  end

  def show
    p ivar
  end

  private

  attr_reader :ivar
end

def Queue
  def initialize
    @ivar = []
  end

  def enqueue(el)
    ivar << el
  end

  def dequeue
    ivar.shift
  end

  def show
    p ivar
  end

  private

  attr_reader :ivar
end
