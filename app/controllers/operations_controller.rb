class OperationsController < ApplicationController
  def create
    operation = OperationService.calculate(
      params[:first_number],
      params[:second_number],
      params[:operation_type]
    )

    render json: OperationSerializer.new(operation).serialize!
  rescue => error
    render json: { error: error.message }, status: :bad_request
  end
end
