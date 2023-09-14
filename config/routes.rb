Rails.application.routes.draw do
  resources :books, only: [:new, :create, :index, :show, :edit, :destroy, :update]
  resources :user, only: [:index, :show, :edit]
  get 'homes/top'
  
  devise_for :users
  root to: 'homes#top'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end