Rails.application.routes.draw do
  devise_for :users
  root to: "users#index"
  resources :users, only: [:new, :create, :edit, :update, :show]
  resources :meals, only: [:index, :create]
  resources :calories, only: [:index, :create]
  resources :records
  post '/calculations/calculate_bmr', to: 'calculations#calculate_bmr'
  get 'home', to: 'records#home'
  get 'day_record', to: 'records#day_record'
  get '*path', to: 'records#not_found'
end