Rails.application.routes.draw do
  root 'static_pages#home'
  get 'signup', to: 'users#new'
  post '/signup',  to: 'users#create'
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'
  resources :users, only: [:new, :create, :show]
  resources :events, only: [:index, :new, :create, :show]
  resources :invitations, only: [:new, :create]
end
