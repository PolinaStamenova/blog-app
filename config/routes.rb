Rails.application.routes.draw do

  devise_for :users
  root 'users#index'

  resources :users, only: [:index, :show] do
    resources :posts, only: [:index, :show, :new, :create]
  end

  resources :posts do
    resources :comments, only: [:create]
    resources :likes, only: [:create]
  end

  resources :comments, only: [:destroy]

  resources :posts, only: [:destroy]

end
