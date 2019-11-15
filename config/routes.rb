Rails.application.routes.draw do
  get 'users/index'
  resources :squares
  get 'comments/index'
  get 'discussions/index'
  root to: 'home#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
