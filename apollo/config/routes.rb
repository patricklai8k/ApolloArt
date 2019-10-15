Rails.application.routes.draw do
  resources :submissions do
    resources :comments, only:[:create]
  end
  resources :users
  root 'submissions#index'
  get '/signup', to: 'users#new'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  post '/logout', to: 'sessions#destroy', as: :log_out
end
