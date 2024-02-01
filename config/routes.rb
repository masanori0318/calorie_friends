Rails.application.routes.draw do
  devise_for :users
  root to: "users#index"
  resources :users, only: [:edit, :update]
  #root 'calculations#index'
  #post '/calculations/calculate_bmr', to: 'calculations#calculate_bmr'
end
