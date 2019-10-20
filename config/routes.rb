Rails.application.routes.draw do
  devise_for :users
  root 'logs#index'
  resources :logs
  resources :users, only: [:show]
end
