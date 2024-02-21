Rails.application.routes.draw do
  devise_for :users
  root to: "users#index"
  resources :users, only: [:new, :create, :edit, :update, :show, :destroy]
  resources :meals, only: [:index, :create]
  resources :calories, only: [:index, :create]
  resources :records, only: [:index, :new, :create, :show, :edit, :update, :destroy] # recordsにcreateアクションのみを追加
  post '/calculations/calculate_bmr', to: 'calculations#calculate_bmr'
  get 'home', to: 'records#home'
  get 'day_record/:year/:month/:day', to: 'records#day_record', as: 'day_record'
  get '*path', to: 'records#not_found'
end