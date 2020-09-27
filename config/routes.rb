Rails.application.routes.draw do
  get 'post/detail/:id' , to: 'posts#detail', as: :detail
  get 'home/reference/:id' , to: 'home#reference', as: :reference  
  resources :posts
  get 'admin' , to: 'posts#index'
  devise_for :users
  resources :familles
  root to: "home#index"
  resources :roles
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
