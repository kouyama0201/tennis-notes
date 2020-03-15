Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }

  root 'logs#index'
  resources :logs do
    resources :comments, only: %i[create destroy]
    resources :likes, only: %i[create destroy]
  end

  resources :users, only: %i[index show] do
    member do
      get :like, :following, :followers
    end
  end

  resources :relationships, only: %i[create destroy]
end
