Rails.application.routes.draw do

  devise_for :users
  root to: "homes#top"
  get "home/about", to: "homes#about"
  patch 'books/:id' => 'books#update', as: 'update_book'
  resources :users, only: [:index, :show, :edit, :update] do
  resource :favorite, only: [:create, :destroy]
  resources :books, only: [:index, :show, :create, :edit, :update, :destroy]
end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
