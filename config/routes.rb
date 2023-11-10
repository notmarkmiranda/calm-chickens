Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  resources :users, only: [:new, :create]
  get "dashboard", to: "users#show", as: "dashboard"

  root "home#index"

  get "up" => "rails/health#show", as: :rails_health_check
end
