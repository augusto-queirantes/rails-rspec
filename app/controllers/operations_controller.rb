# frozen_string_literal: true

class OperationsController < ApplicationController
  def create
    operation = OperationService.calculate(
      params[:first_number],
      params[:second_number],
      params[:operation_type]
    )

    render json: OperationSerializer.new(operation).serialize!
  rescue StandardError => e
    render json: { error: e.message }, status: :bad_request
  end
end
