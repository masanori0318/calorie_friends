Rails.application.routes.draw do
  devise_for :users
  root to: "users#index"
  resources :users, only: [:new, :create, :edit, :update]
  #root 'users#index'
  #post '/calculations/calculate_bmr', to: 'calculations#calculate_bmr'
end
