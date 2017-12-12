class ValidateExpression
  def operand
    @operand = %w[+ - * /]
  end

  def is_operand?(token)
    operand.include?(token)
  end
end