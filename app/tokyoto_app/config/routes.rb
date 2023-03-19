Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  root "top#index"
  get "top", to: "top#top"
  get "login", to: "user_sessions#new"
  post "login", to: "user_sessions#create"
  delete "logout", to: "user_sessions#destroy"
  get "search", to: "top#search"
  resources :top, only: %i[index show]
  resources :users, only: %i[new create destroy]
  resource :profile
  get "user_supports", to: "profiles#user_supports"
  get "hospitals/index", to: "hospitals#index"
  get "hospitals/search", to: "hospitals#search"
  get "map/hospitals", to: "map/hospitals#index"
  get "terms_of_use", to: "top#terms_of_use"

  get "privacy_policy", to: "top#privacy_policy"

  namespace :municipality do
    resources :supports do
      post "preview", on: :collection
      post "back", on: :collection
    end
    get "login", to: "municipality_sessions#new"
    post "login", to: "municipality_sessions#create"
    delete "logout", to: "municipality_sessions#destroy"
  end
end
