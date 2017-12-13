require './lib/calculator'
# driver that invokes other classes
class RPN
  calculator = Calculator.new
  calculator.input_token
end