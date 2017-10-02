Rails.application.routes.draw do
  resources :users
  resources :audition_requests
  resources :roles
  resources :productions
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
