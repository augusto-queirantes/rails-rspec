# frozen_string_literal: true

RSpec.describe OperationsController, type: :request do
  describe 'POST /operations' do
    let(:request) { post '/operations', params: params }

    context 'when params are valid' do
      context 'when plus' do
        let(:params) do
          {
            first_number: 1,
            second_number: 2,
            operation_type: 'plus'
          }
        end
        let(:expected_response) do
          {
            first_number: 1,
            second_number: 2,
            operation_type: 'plus',
            result: 3
          }.to_json
        end

        it 'returns expected status' do
          request

          expect(response).to be_successful
        end

        it 'returns expected response' do
          request

          expect(response.body).to eq(expected_response)
        end
      end

      context 'when minus' do
        let(:params) do
          {
            first_number: 1,
            second_number: 2,
            operation_type: 'minus'
          }
        end
        let(:expected_response) do
          {
            first_number: 1,
            second_number: 2,
            operation_type: 'minus',
            result: -1
          }.to_json
        end

        it 'returns expected status' do
          request

          expect(response).to be_successful
        end

        it 'returns expected response' do
          request

          expect(response.body).to eq(expected_response)
        end
      end
    end

    context 'when params are not valid' do
      context 'when first_number is invalid' do
        let(:error_message) { 'Validation failed: First number is not a number' }
        let(:expected_response) { { error: error_message }.to_json }
        let(:params) do
          {
            first_number: 'wrong',
            second_number: 2,
            operation_type: 'minus'
          }
        end

        it 'returns expected status' do
          request

          expect(response).to be_bad_request
        end

        it 'returns expected response' do
          request

          expect(response.body).to eq(expected_response)
        end
      end

      context 'when first_number is invalid' do
        let(:error_message) { 'Validation failed: Second number is not a number' }
        let(:expected_response) { { error: error_message }.to_json }
        let(:params) do
          {
            first_number: 1,
            second_number: 'wrong',
            operation_type: 'minus'
          }
        end

        it 'returns expected status' do
          request

          expect(response).to be_bad_request
        end

        it 'returns expected response' do
          request

          expect(response.body).to eq(expected_response)
        end
      end

      context 'when first_number is invalid' do
        let(:error_message) { "'wrong' is not a valid operation_type" }
        let(:expected_response) { { error: error_message }.to_json }
        let(:params) do
          {
            first_number: 1,
            second_number: 2,
            operation_type: 'wrong'
          }
        end

        it 'returns expected status' do
          request

          expect(response).to be_bad_request
        end

        it 'returns expected response' do
          request

          expect(response.body).to eq(expected_response)
        end
      end
    end
  end
end
