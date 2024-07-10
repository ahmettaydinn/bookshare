Rails.application.routes.draw do
  devise_for :users

  get "up" => "rails/health#show", as: :rails_health_check

  root to: "dashboard#index"

  resources :books, only: [:index, :new, :create, :show]
end
