Rails.application.routes.draw do
  root 'users#new'

  resources :users, only: [:create]

  get :register, to: 'users#new'
end
