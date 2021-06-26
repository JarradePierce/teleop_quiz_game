Rails.application.routes.draw do
  resources :games

  resources :users do
    resources :games, only: [:edit, :update, :destroy, :show, :create, :new]
  end

  resources :sessions, only: [:create, :new, :destroy]

  delete '/logout' => 'sessions#destroy'
  post '/login' => 'sessions#create'
  get '/login' => 'sessions#new'

  root to: "users#new"
end
