Rails.application.routes.draw do
  #send to root page
  root 'sessions#home'

  #signup user
  get '/signup' => 'users#new'
  post '/signup' => 'users#create' #help user to see signup if they don't signup correctly

  #login user
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create' 

  #logout user
  delete '/logout' => 'sessions#destroy'

  resources :restaurants
  resources :reviews
  resources :reservations
  resources :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
