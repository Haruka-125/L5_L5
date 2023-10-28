Rails.application.routes.draw do
  # get 'tweets/index'
  # get 'tweets/new'
  # get 'tweets/create'
  # get 'tweets/destroy'
  get 'users/index'
  get 'users/new'
  get 'users/create'
  get 'users/destroy'
  post 'users/create'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  #root 'users#index'
  resources :tweets
  root 'tweets#index'
  delete 'users/:id', to: 'users#destroy'
  post 'top/login'
  get 'get/logout'
  # Defines the root path route ("/")
  # root "articles#index"
end
