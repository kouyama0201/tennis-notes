Rails.application.routes.draw do
  devise_for :users
  root 'logs#index'
  resources :logs do
    resources :comments, only: [:create]
  end
  resources :users, only: [:show]
end
