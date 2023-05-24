Rails.application.routes.draw do
  devise_for :users
  get 'home/index'
  resources :foods, only: [:index, :new, :create, :destroy]
  resources :recipes, only: [:index, :new, :create, :destroy]
  root 'home#index'
  get '/general_shopping_list', to: 'shopping_list#index', as: 'general_shopping_list'
end
