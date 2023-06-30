Rails.application.routes.draw do
  devise_for :users
  root "users#index"
  resources :users, only: [:index, :create, :destroy]
  resources :main_recipes
  resources :foods, except: [:show]
  resources :recipes
  resources :recipe_foods, only: [:update, :edit, :new, :create, :destroy]

  get '/public_recipes', to: 'public_recipes#index', as: "public_recipes"
  get '/general_shopping_lists', to: 'general_shopping_lists#index', as: "general_shopping_lists"
end
