Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :movies, only: [:show, :index, :create]
  
  # get '/movies', to: 'movies#index'
  # get '/movies/:id', to: 'movies#show'
  # get '/movies/new', to 'movies#new'
  
end
