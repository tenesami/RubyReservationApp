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

  #omniauth callback route
get "/auth/:provider/callback" => 'sessions#google'
#get 'auth/google_oauth2/callback', to: 'sessions#google'

  #creates a nested restaurant routes 
  resources :restaurants  do
    resources :reservations
  end
  resources :reservations 
  #creates a nested user routes 
  resources :users do
    resources :restaurants, shallow: true
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
