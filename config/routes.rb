Rails.application.routes.draw do
  root 'flights#index'

  resources :flights
  resources :airports

  get '/search', to: 'flights#index'
end
