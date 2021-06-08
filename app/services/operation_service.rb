class OperationService
  class << self
    def calculate(first_number, second_number, operation_type)
      operation = create_operation!(first_number, second_number, operation_type)
      operation_class = OperationFactory.for(operation.operation_type)

      operation_class.perform(operation)
    end

    private

    def create_operation!(first_number, second_number, operation_type)
      Operation.create!(
        first_number: first_number,
        second_number: second_number,
        operation_type: operation_type
      )
    end
  end
end
