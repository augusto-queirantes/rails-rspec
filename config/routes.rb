Rails.application.routes.draw do
  resources :operations, only: [:create]
end
