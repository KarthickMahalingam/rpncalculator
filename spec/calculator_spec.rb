require_relative '../lib/calculator'
require 'spec_helper'
RSpec.describe 'Calculator: ' do
  subject(:calculator) { Calculator.new }

  describe 'calculator' do
    it 'should exit program when q as input' do
      expect(STDIN).to receive(:gets).and_return('1')
      expect(STDIN).to receive(:gets).and_return('q')
      calculator.input_token
    end

    it 'should return correct sum output on stack' do
      calculator.process_token("1")
      calculator.process_token("2")
      calculator.process_token("+")
      expect(calculator.stack.pop_stack).to eq(3)
    end

    it 'should raise invalid operand  if operators mismatch' do
      calculator.process_token('_')
      expect(calculator.process_token('_')).to eq(nil)
    end

    it 'should raise Stack UnderflowError' do
      expect {calculator.process_token('+')}.to raise_error(error_message = 'Stack is empty')
    end

    it 'should throw message for when divided by zero' do
      calculator.process_token('1')
      calculator.process_token('0')
      calculator.process_token('/')
      expect {calculator.process_token('/')}.to raise_error
    end
  end


end