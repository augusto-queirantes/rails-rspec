# frozen_string_literal: true

RSpec.describe OperationSerializer do
  describe '.serialize!' do
    let(:class_call) { described_class.new(operation).serialize! }
    let(:operation) { create(:operation, :plus) }
    let(:expected_response) do
      {
        first_number: operation.first_number,
        second_number: operation.second_number,
        operation_type: operation.operation_type,
        result: operation.result
      }
    end

    it 'returns expected value' do
      expect(class_call).to eq(expected_response)
    end
  end
end
