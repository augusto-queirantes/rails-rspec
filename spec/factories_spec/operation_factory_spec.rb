RSpec.describe OperationFactory do
  let(:class_call) { described_class.for(operation_type) }

  describe '.form' do
    describe 'when there is no errors' do
      context 'when plus' do
        let(:operation_type) { 'plus' }

        it 'returns Plus' do
          expect(class_call).to eq(Plus)
        end
      end

      context 'when minus' do
        let(:operation_type) { 'minus' }

        it 'returns Plus' do
          expect(class_call).to eq(Minus)
        end
      end
    end

    describe 'when there is errors' do
      let(:error_message) { "Unexpected operation_type #{operation_type}" }

      context 'when something else' do
        let(:operation_type) { 'something else' }

        it 'returns Plus' do
          expect { class_call }.to raise_error(StandardError, error_message)
        end
      end

      context 'when nil' do
        let(:operation_type) { nil }

        it 'returns Plus' do
          expect { class_call }.to raise_error(StandardError, error_message)
        end
      end
    end
  end
end
