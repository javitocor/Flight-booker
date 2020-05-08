Rails.application.routes.draw do
  root 'flights#index'

  resources :flights
  resources :airports
  resources :bookings, only: [:new, :create, :show]

  
  get '/search', to: 'flights#index'
end
