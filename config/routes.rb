Rails.application.routes.draw do
  
  resources :users
  resources :attractions
  post 'rides/new' => 'rides#new'

  root :to => 'users#home'

  get 'signin' => 'sessions#new'
    post 'signin' => 'sessions#create'
    delete 'logout' => 'sessions#destroy'



end