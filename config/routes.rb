Rails.application.routes.draw do
  get 'posts/index'
  get 'posts/show'
  get 'users', to: 'users#index'
  get 'users/:id', to: 'users#show', as: 'user'
end
