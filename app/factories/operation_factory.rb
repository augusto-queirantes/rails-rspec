class OperationFactory
  def self.for(operation_type)
    case operation_type
    when 'plus'
      ::Plus
    when 'minus'
      ::Minus
    else
      raise "Unexpected operation_type #{operation_type}"
    end
  end
end
