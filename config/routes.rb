Rails.application.routes.draw do
  devise_for :users
  root to: "users#index"
  resources :users, only: [:new, :create, :edit, :update, :show]
  resources :images, only: [:index, :new, :create]
  resources :meals, only: [:index, :create]
  resources :calories, only: [:index, :create]
  resources :records
  post '/calculations/calculate_bmr', to: 'calculations#calculate_bmr'
  get 'home', to: 'records#home'
  get 'day_record', to: 'records#day_record'
  get '*path', to: 'records#not_found'
  get 'records/index'
  get '/records/show_image', to: 'records#show_image'
  get '/records/:id/show_image/:image_id', to: 'records#show_image', as: 'show_image'
  post "/meals", to: "meals#create"
  post '/records/create', to: 'records#create', as: 'create_record'
  # Catch-all route for not found errors
  get '*path', to: 'records#not_found'
end
