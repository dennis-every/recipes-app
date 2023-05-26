Rails.application.routes.draw do
  devise_for :users
  get 'home/index'
  resources :foods, only: [:index, :new, :create, :destroy]
  resources :recipes, except: [:edit, :update] do
    resources :recipe_foods, only: [:new, :create, :destroy]
  end
  root 'home#index'
  get '/general_shopping_list', to: 'shopping_list#index', as: 'general_shopping_list'
  get '/public_recipes', to: 'recipes#public'
end
