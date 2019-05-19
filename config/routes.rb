Rails.application.routes.draw do
  
  get 'posts/new'

  get 'users/new'
  resources :users
  
  resources :posts

  root to: 'home#index'
  get 'home/index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
