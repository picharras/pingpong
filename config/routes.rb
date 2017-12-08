Rails.application.routes.draw do
  resources :leadboards, only: [:index, :show]
  resources :games, only: [:index, :show, :new, :create]
  devise_for :users
  root to: 'games#index'
  get '/history', to: 'home#history'
  get '/log',     to: 'home#log'
end
