# frozen_string_literal: true

RSpec.describe Times do
  describe '#times' do
    let(:class_call) { described_class.perform(operation) }
    let(:operation) { create(:operation, :times, first_number: 1, second_number: 2) }

    context 'when both numbers are greather than zero' do
      it 'returns expected value' do
        expect(class_call).to eq(2)
      end
    end
  end
end
