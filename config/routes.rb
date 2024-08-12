Rails.application.routes.draw do
  devise_for :users

  get "up" => "rails/health#show", as: :rails_health_check

  root to: "dashboard#index"

  resources :books, only: [:new, :create, :show, :destroy] do
    resources :comments, only: [:create, :destroy]
    
    # Adding routes for favorites
    resource :favorite, only: [:create, :destroy]
  end

  # Route to list all favorite books for the current user
  resources :favorites, only: :index
end
