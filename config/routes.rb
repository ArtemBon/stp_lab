Rails.application.routes.draw do
  root 'users#new'

  resources :users, only: [:create] do
    member do
      get :unsubscribe, to: 'users#destroy'
    end
  end

  get :register, to: 'users#new'

  post :send_emails, to: 'reports#create'
end
