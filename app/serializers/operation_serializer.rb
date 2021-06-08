class OperationSerializer
  def initialize(operation)
    @operation = operation
  end

  def serialize!
    {
      first_number: operation.first_number,
      second_number: operation.second_number,
      operation_type: operation.operation_type,
      result: operation.result
    }
  end

  private

  attr_reader :operation
end
