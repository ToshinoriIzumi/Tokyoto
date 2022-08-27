Rails.application.routes.draw do
  root "top#index"
  resources :top, only: %i[top show]
  get 'search', to: 'top#search'
end
