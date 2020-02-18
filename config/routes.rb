Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }
  root 'logs#index'
  resources :logs do
    resources :comments, only: %i[create destroy]
    resources :likes, only: %i[create destroy]
  end

  resources :users, only: [:show] do
    member do
      get :following, :followers, :users_logs
    end
  end

  resources :relationships, only: %i[create destroy]
end
