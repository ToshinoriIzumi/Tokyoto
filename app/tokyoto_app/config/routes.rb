Rails.application.routes.draw do
  get 'top_pages/main'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'top_pages#main'
end
