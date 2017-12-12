class Stack
  def initialize
    calc_stack
  end

  def self.calc_stack
    @stack = []
  end

  def push_stack(token)
    calc_stack.push(token)
  end

  def pop_stack
    calc_stack.pop
  end

end