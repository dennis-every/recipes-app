Rails.application.routes.draw do
  devise_for :users
  get 'home/index'
  resources :foods, only: [:index, :new, :create, :destroy]
  root 'home#index'
end
