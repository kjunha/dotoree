Rails.application.routes.draw do
  get "signup" => 'users#new'
  get "login" => 'sessions#new'
  get "reset_password" => 'passwords#new'
  get "logout" => 'sessions#destroy'
  get 'about' => 'home#about'
  
  get "auth/:provider/callback", to: "authentications#create"
  
  resources :users
  resources :sessions
  resources :passwords
  resources :squares do
    resources :discussions do
      resources :comments
    end
  end
  
  
  root to: 'home#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
