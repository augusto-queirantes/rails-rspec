# frozen_string_literal: true

Rails.application.routes.draw do
  resources :operations, only: [:create]
end
