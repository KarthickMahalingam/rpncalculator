require 'pry'
require './bin/validate_expression'
require './bin/stack'
# main script that performs RPM calculation
class Calculator
  def initialize
    @stack = Stack.new
    @validate_expression = ValidateExpression.new
  end

  def input_token
    loop do
      print '>'
      token = gets.chomp
      return if token == 'q'
      process_token(token)
    end
  end

  def process_token(token)
    if @validate_expression.is_numeric?(token)
      @stack.push_stack(token)
    elsif @validate_expression.is_operand?(token)
      parse_operand
      evaluate(token)
    end
  end

  def parse_operand
    @operand2 = @stack.pop_stack
    @operand1 = @stack.pop_stack
  end

  def evaluate(token)
    operator = @validate_expression.to_operand(token)
    result = @operand1.send(operator, @operand2)
    @stack.push_stack(result)
    puts(result)
  rescue ZeroDivisionError
      puts 'Cannot divide by zero'
  end

  calc = Calculator.new
  calc.input_token
end