Rails.application.routes.draw do
  get 'home/index'
  resources :foods, only: [:index, :new, :create, :destroy]
  root 'home#index'
end
