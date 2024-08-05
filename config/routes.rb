Rails.application.routes.draw do
  devise_for :users

  get "up" => "rails/health#show", as: :rails_health_check

  root to: "dashboard#index"

  resources :books, only: [:new, :create, :show, :destroy] do
    resources :comments, only: [:create, :destroy] do
    end
  end
end
