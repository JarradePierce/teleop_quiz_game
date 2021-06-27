Rails.application.routes.draw do
  resources :games

  resources :users do
    resources :games, :questions, only: [:index, :edit, :update, :destroy, :show, :create, :new]

    resources :games do
      resources :questions, only: [:show, :edit, :update, :destroy, :index]

      resources :players, only: [:new, :create]
    end
  end

  resources :sessions, only: [:create, :new, :destroy]

  delete '/logout' => 'sessions#destroy'
  post '/login' => 'sessions#create'
  get '/login' => 'sessions#new'

  root to: "users#new"
end
