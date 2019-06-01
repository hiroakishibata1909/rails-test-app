Rails.application.routes.draw do
  get 'follows/create'

  root to: 'home#index'
  get 'home/index'
  
  get 'posts/new'
  resources :posts
  
  get 'users/new'
  get 'users/index'
  get 'users/logout'
  get 'users/login'
  post 'users/send_login'
  resources :users
  
  resources :follows
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
