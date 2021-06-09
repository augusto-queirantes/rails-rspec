# frozen_string_literal: true

class OperationFactory
  def self.for(operation_type)
    case operation_type
    when 'plus'
      ::Plus
    when 'minus'
      ::Minus
    when 'times'
      ::Times
    else
      raise "Unexpected operation_type #{operation_type}"
    end
  end
end
