Rails.application.routes.draw do
  get '/' => 'sessions#welcome'
  get '/signup' => 'users#new'
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  delete '/logout' => 'sessions#destroy'
  get '/auth/google_oauth2/callback' => 'sessions#omniauth'
  
  resources :games do
    resources :reviews, only: [:new, :index]
  end
  resources :reviews
  resources :genres
  resources :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
