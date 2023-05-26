Rails.application.routes.draw do
  devise_for :users
  root 'recipes#public'
  get '/public_recipes', to: 'recipes#public'
  resources :foods, only: [:index, :new, :create, :destroy]
  resources :recipes, except: [:edit, :update] do
    resources :recipe_foods, only: [:new, :create, :destroy]
  end
  get '/general_shopping_list', to: 'shopping_list#index', as: 'general_shopping_list'
end
