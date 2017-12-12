class ValidateExpression
  def operand
    @operand = %w[+ - * /]
  end

  def is_operand?(token)
    operand.include?(token)
  end

  def is_numeric?(token)
    token.to_i.to_s == token
  end
end