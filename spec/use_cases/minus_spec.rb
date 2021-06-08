# frozen_string_literal: true

RSpec.describe Minus do
  describe '#perform' do
    let(:class_call) { described_class.perform(operation) }
    let(:operation) do
      create(
        :operation,
        :minus,
        first_number: first_number,
        second_number: second_number
      )
    end

    context 'when first_number is greather than second_number' do
      let(:first_number) { 5 }
      let(:second_number) { 1 }

      it 'returns expected value' do
        expect(class_call).to eq(4)
      end
    end

    context 'when first_number is lower than second_number' do
      let(:first_number) { 1 }
      let(:second_number) { 5 }

      it 'returns expected value' do
        expect(class_call).to eq(-4)
      end
    end

    context 'when numbers are equal' do
      let(:first_number) { 1 }
      let(:second_number) { 1 }

      it 'returns expected value' do
        expect(class_call).to eq(0)
      end
    end

    context 'when numbers are zero' do
      let(:first_number) { 0 }
      let(:second_number) { 0 }

      it 'returns expected value' do
        expect(class_call).to eq(0)
      end
    end
  end
end
