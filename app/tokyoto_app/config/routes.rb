Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  root "top#index"
  get "login", to: "user_sessions#new"
  post "login", to: "user_sessions#create"
  delete "logout", to: "user_sessions#destroy"
  get "search", to: "top#search"
  resources :top, only: %i[index show]
  resources :users, only: %i[new create]
  resource :profile
  get "hospitals/index", to: "hospitals#index"
  get "hospitals/search", to: "hospitals#search"
  get "map/hospitals", to: "map/hospitals#index"
end
