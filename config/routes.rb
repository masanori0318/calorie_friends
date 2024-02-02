Rails.application.routes.draw do
  devise_for :users
  root to: "users#index"
  resources :users, only: [:new, :create, :edit, :update, :show]
  post '/calculations/calculate_bmr', to: 'calculations#calculate_bmr'
end
