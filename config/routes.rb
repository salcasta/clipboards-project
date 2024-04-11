Rails.application.routes.draw do
  root "home#index"
  
  resources :orders
  resources :vendors
  resources :clipboards
  resources :inventorysheets
  resources :items
  devise_for :users

  get 'holiday', to: 'holiday#index', as: 'holiday_inventorysheets'
end
