Rails.application.routes.draw do
  #devise_for :users
  devise_for :users, controllers: { passwords: 'devise/passwords' }
  root to: "users#index"
  resources :users, only: [:new, :create, :edit, :update, :show, :destroy]
  resources :meals, only: [:index, :create]
  resources :calories, only: [:index, :create]
  resources :records, only: [:index, :new, :create, :show, :edit, :update, :destroy] # recordsにcreateアクションのみを追加
  post '/calculations/calculate_bmr', to: 'calculations#calculate_bmr'
  get 'home', to: 'records#home'
  get 'day_record/:year/:month/:day', to: 'records#day_record', as: 'day_record'
  
  devise_scope :user do
    get 'users/password/edit_custom', to: 'devise/passwords#edit', as: :edit_user_password_custom
    put 'users/password/update_custom', to: 'devise/passwords#update', as: :user_password_custom
    put 'users/password/edit_custom', to: 'devise/passwords#update' # PUTメソッドに対応するルートを追加
    post 'users/password/reset_custom', to: 'devise/passwords#create', as: :user_password_reset_custom
  end
  
  get '*path', to: 'records#not_found'
end