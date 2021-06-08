RSpec.describe OperationService do
  describe '#calculate' do
    let(:class_call) { described_class.calculate(first_number, second_number, operation_type) }

    context 'when parame are valid' do
      let(:first_number) { 1 }
      let(:second_number) { 2 }

      context 'when operation_type is plus' do
        before do
          allow(OperationFactory).to receive(:for).and_return(Plus)
          allow(Plus).to receive(:perform)
        end

        let(:operation_type) { 'plus' }

        it 'creates a new operation with expected data' do
          expect {
            class_call
          }.to change {
            Operation.where(
              first_number: first_number,
              second_number: second_number,
              operation_type: operation_type
            ).count
          }.from(0).to(1)

          class_call
        end

        it 'calls OperationFactory with expected parameters' do
          expect(OperationFactory).to receive(:for).with(operation_type).once

          class_call
        end

        it 'calls Plus with expected parameters' do
          expect(Plus).to receive(:perform).with(an_instance_of(Operation)).once

          class_call
        end
      end

      context 'when operation_type is minus' do
        before do
          allow(OperationFactory).to receive(:for).and_return(Minus)
          allow(Minus).to receive(:perform)
        end

        let(:operation_type) { 'minus' }

        it 'creates a new operation with expected data' do
          expect {
            class_call
          }.to change {
            Operation.where(
              first_number: first_number,
              second_number: second_number,
              operation_type: operation_type
            ).count
          }.from(0).to(1)

          class_call
        end

        it 'calls OperationFactory with expected parameters' do
          expect(OperationFactory).to receive(:for).with(operation_type).once

          class_call
        end

        it 'calls Plus with expected parameters' do
          expect(Minus).to receive(:perform).with(an_instance_of(Operation)).once

          class_call
        end
      end
    end

    context 'when params are invalid' do
      context 'when first_number is invalid' do
        let(:first_number) { 'wrong' }
        let(:second_number) { 1 }
        let(:operation_type) { 'plus' }
        let(:error_message) { 'Validation failed: First number is not a number' }

        it 'raises error' do
          expect {
            class_call
          }.to raise_error(ActiveRecord::RecordInvalid, error_message)
        end
      end

      context 'when second_number is invalid' do
        let(:first_number) { 1 }
        let(:second_number) { 'wrong' }
        let(:operation_type) { 'plus' }
        let(:error_message) { 'Validation failed: Second number is not a number' }

        it 'raises error' do
          expect {
            class_call
          }.to raise_error(ActiveRecord::RecordInvalid, error_message)
        end
      end

      context 'when operation_type is invalid' do
        let(:first_number) { 1 }
        let(:second_number) { 1 }
        let(:operation_type) { 'wrong' }
        let(:error_message) { "'wrong' is not a valid operation_type" }

        it 'raises error' do
          expect {
            class_call
          }.to raise_error(ArgumentError, error_message)
        end
      end
    end
  end
end
