Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }
  root 'logs#index'
  resources :logs do
    resources :comments, only: [:create, :destroy]
    resources :likes, only: [:create, :destroy]
  end

  resources :users, only: [:show] do
    member do
      get :following, :followers, :users_logs
    end
  end

  resources :relationships, only: [:create, :destroy]
end
