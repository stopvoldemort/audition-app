Rails.application.routes.draw do
  resources :users
  resources :audition_requests
  resources :roles
  resources :productions
  get '/signin', to: 'sessions#new'
  post '/signin', to: 'sessions#create'
  post '/signout', to: 'sessions#destroy'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
