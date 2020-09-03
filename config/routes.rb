Rails.application.routes.draw do
  root 'sessions#home'

  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create' #help user to see signup if they don't signup correctly
  get '/signup' => 'users#new'
  post '/signup' => 'users#create'
  delete '/logout' => 'sessions#destroy'

  resources :restaurants
  resources :reviews
  resources :reservations
  resources :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
