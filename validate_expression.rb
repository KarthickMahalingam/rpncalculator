class ValidateExpression
  class InvalidOperandError < StandardError;
  end

  def operand
    @operand = %w[+ - * /]
  end

  def is_operand?(token)
    check_operand = validate_operand(token)
    unless check_operand
      raise InvalidOperandError, 'Invalid operand - Operand not yet supported'
    end
    return check_operand
  rescue InvalidOperandError => error
    puts error.message
  end

  def validate_operand(token)
    operand.include?(token)
  end

  def to_operand(token)
    token.to_sym
  end

  def token_to_num(token)
    token.to_i
  end

  def is_numeric?(token)
    token_to_num(token).to_s == token
  end
end