Rails.application.routes.draw do
  devise_for :users
  
  resources :books, only: [:new, :create, :index, :show, :edit, :destroy]
  resources :users, only: [:index, :show, :edit, :update]
  get 'homes/top'
  get "home/about", to: 'homes#about', as: 'about_home'
  #get 'homes/about' => 'homes#about', as: 'about_home'
  patch 'books/:id' => 'books#update', as: 'update_book'
  
  
  root to: "homes#top"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
