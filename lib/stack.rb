class Stack
  class StackUnderFlowError < StandardError;
  end

  def initialize
    @stack = []
    @validate_expression = ValidateExpression.new
  end

  def push_stack(token)
    @stack.push(token.to_i)
  end

  def stack_size
    @stack.size
  end

  def pop_stack
    raise StackUnderFlowError, 'Stack is empty' if is_empty?
    @stack.pop
  end

  def is_empty?
    @stack.empty?
  end
end