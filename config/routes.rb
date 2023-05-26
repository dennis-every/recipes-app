Rails.application.routes.draw do
  devise_for :users
  resources :foods, only: [:index, :new, :create, :destroy]
  resources :recipes, except: [:edit, :update] do
    resources :recipe_foods, only: [:new, :create, :destroy]
  end
  get '/general_shopping_list', to: 'shopping_list#index', as: 'general_shopping_list'
  get '/public_recipes', to: 'recipes#public'
  root 'recipes#public'
end
