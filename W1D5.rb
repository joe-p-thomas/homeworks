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

class Queue
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

class Map
  def initialize
    @ivar = []
  end

  def assign(key, value)
    entry_exists = ivar.find { |pair| pair[0] == key }
    if entry_exists
      entry_exists[1] = value
    else
      ivar << [key, value]
    end
  end

  def lookup(key)
    ivar.find { |pair| pair[0] == key }[1]
  end

  def remove(key)
    ivar.select! { |pair| pair[0] == key }
  end

  def show
    ivar.each { |pair| p "#{pair[0]} => #{pair[1]}" }
  end

  private

  attr_reader :ivar
end
