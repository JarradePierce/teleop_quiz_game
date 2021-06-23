Rails.application.routes.draw do
  resources :games

  resources :users

  resources :sessions, only: [:create, :new, :destroy]

  delete '/logout' => 'sessions#destroy'
  post '/login' => 'sessions#create'
  get '/login' => 'sessions#new'
  
  root to: "games#index"
end
