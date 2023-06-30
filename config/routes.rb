Rails.application.routes.draw do
  devise_for :users
  root "users#index"
  resources :users, only: [:index, :create, :destroy]
  resources :main_recipes, only: [:index, :show, :destroy, :update]
  resources :foods, except: [:show]
  resources :recipes

  get '/public_recipes', to: 'public_recipes#index'
end
