class Stack

  def initialize
    @ivar = []
  end

  def add(el)
    ivar << el
  end

  def remove(el)
    ivar.pop
  end

  def show
    p ivar
  end

  private
    attr_reader :ivar
end
