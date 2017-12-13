require './lib/validate_expression'
require './lib/stack'
require 'pry'
# main script that performs RPM calculation
class Calculator
  class InSufficientOperandError < StandardError;
  end

  def initialize
    @stack = Stack.new
    @validate_expression = ValidateExpression.new
  end

  def stack
    @stack
  end

  def validate
    @validate_expression
  end

  def quit_on_int
    puts "U sure killed me guud!"
    exit
  end

  trap "SIGINT" do
    puts "Exiting"
    exit 130
  end

  def input_token
    loop do
    begin
      print '>'
      token = STDIN.gets.chomp
      return if token == 'q'
      process_token(token)
    end
    end
  end

  def process_token(token)
    if validate.is_numeric?(token)
      stack.push_stack(token)
    elsif validate.is_operand?(token)
      parse_operand
      evaluate(token)
    end
  end

  def parse_operand
    raise InSufficientOperandError unless stack.stack_size > 2
    @operand2 = stack.pop_stack
    @operand1 = stack.pop_stack
  rescue InSufficientOperandError => error
    puts 'Insufficient operand to process..Exiting..'
    exit
  end

  def evaluate(token)
    operator = validate.to_operand(token)
    result = @operand1.send(operator, @operand2)
    stack.push_stack(result)
    puts(result)
  rescue ZeroDivisionError
    puts 'Cannot divide by zero'
  end
end