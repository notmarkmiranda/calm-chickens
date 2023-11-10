Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  root "home#index"

  get "sign-up-or-in", to: "users#new", as: "sign_up_or_in"
  post "sign-up-or-in", to: "users#create"
  delete "sign-out", to: "sessions#destroy", as: "sign_out"
  get "dashboard", to: "users#show", as: "dashboard"

  resources :pools, only: [:show, :new, :create]

  get "up" => "rails/health#show", as: :rails_health_check
end
