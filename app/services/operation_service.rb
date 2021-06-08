class OperationService
  class << self
    def calculate(first_number, second_number, operation_type)
      operation = create_operation!(first_number, second_number, operation_type)
      operation_class = OperationFactory.for(operation.operation_type)

      result = operation_class.perform(operation)

      update_operation_result(operation, result)

      operation
    end

    private

    def create_operation!(first_number, second_number, operation_type)
      Operation.create!(
        first_number: first_number,
        second_number: second_number,
        operation_type: operation_type
      )
    end

    def update_operation_result(operation, result)
      operation.update!(result: result)
    end
  end
end
