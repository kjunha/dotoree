Rails.application.routes.draw do
  get "signup" => 'users#new'
  get "login" => 'sessions#new'
  get "logout" => 'sessions#destroy'
  
  get "auth/:provider/callback", to: "authentications#create"
  
  resources :users
  resources :sessions
  resources :squares
  get 'comments/index'
  get 'discussions/index'
  root to: 'home#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
