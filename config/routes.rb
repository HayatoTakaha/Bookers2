Rails.application.routes.draw do
  
  root to: "homes#top"
  devise_for :users
  resources :books, only: [:new, :create, :index, :show, :destroy]
  #get 'books/new'
  #get 'books/index'
  #get 'books/show'
  #get 'books/edit'
  #get 'homes/top'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
