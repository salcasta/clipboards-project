Rails.application.routes.draw do
  resources :orders
  resources :vendors
  resources :clipboards
  resources :inventorysheets
  resources :items
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
   root "clipboards#index"
end
