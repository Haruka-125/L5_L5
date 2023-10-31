Rails.application.routes.draw do
  get 'likes/create'
  get 'likes/destroy'
  #post 'likes/:id' , to: 'likes#create'
  #delete 'likes/:id' , to: 'likes#destroy'
  #resources :likes, only: [:create, :destroy], path: "likes"
  #get 'likes'
  
  # resources :likes, only: [:create] do
  #   member do
  #     delete :destroy
  #   end
  # end
  
  resources :likes, only: [:create, :destroy] do
    post 'likes', on: :member, to: 'likes#create'
    delete 'likes', on: :member, to: 'likes#destroy'
  end
  
  get 'top/main'
  get 'top/login'
  get 'top/logout'
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
  get 'top/logout'
  # Defines the root path route ("/")
  # root "articles#index"
end
