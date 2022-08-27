Rails.application.routes.draw do
  root "top#index"
  resources :top, only: %i[index show]
  get "search", to: "top#search"
end
