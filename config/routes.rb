Rails.application.routes.draw do
  devise_for :users
  root "users#index"
  resources :users, only: [:index, :show]
  resources :main_recipes, only: [:index, :show, :destroy, :update]
  resources :foods, except: [:show]
end
