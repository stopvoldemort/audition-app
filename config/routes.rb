Rails.application.routes.draw do
  get '/signin', to: 'sessions#new'
  post '/signin', to: 'sessions#create'
  post '/signout', to: 'sessions#destroy'
  get '/actors', to: 'users#index'
  get '/productions/:id/assign_auditions', to: 'productions#assign_auditions'
  post '/productions/:id/assign_auditions', to: 'productions#post_audition_requests'
  get '/productions/:id/assign_roles', to: 'productions#assign_roles'
  post '/productions/:id/assign_roles', to: 'productions#post_assign_roles'
  post '/audition_requests_update', to: 'audition_requests#accept_audtions'
  resources :users
  resources :audition_requests
  resources :roles
  resources :productions


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
