require 'pry'
class Calculator
  @stack = []
  def self.is_numeric?(token)
    token.to_i.to_s == token.to_s
  end

  def self.get_token
    loop do
      print ">"
      token = gets.chomp
      return if token == 'q'
      process_token(token)
    end
  end
  def self.is_operator?(token)
    operator = ['+', '-', '*', '/']
    operator.include?(token)
  end

  def self.push_stack(token)
    @stack.push(token.to_i)
  end

  def self.process_token(token)
    if is_numeric?(token)
      push_stack(token)
    elsif is_operator?(token)
      evaluate(token)
    end
  end

  def self.evaluate(token)
    operand2 = @stack.pop()
    operand1 = @stack.pop()
    operator = token.to_sym
    result = operand1.send(operator, operand2)
    @stack.push(result)
    puts(result)
  end

  calc = Calculator.get_token
end