Rails.application.routes.draw do
  devise_for :users

  get "up" => "rails/health#show", as: :rails_health_check

  root to: "dashboard#index"

  resources :books, only: [:new, :create, :show, :destroy] do
    resources :comments, only: [:create, :destroy]
    
    # Adding routes for favorites
    resource :favorite, only: [:create, :destroy]
    
    resources :ratings, only: [:create, :update]
  end

  # Route for user's favorite books
  get 'favorites', to: 'favorites#index', as: :user_favorites
end
