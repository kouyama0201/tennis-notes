Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }
  root 'logs#index'
  resources :logs do
    resources :comments, only: [:create, :destroy]
  end
  resources :users, only: [:show]
end
