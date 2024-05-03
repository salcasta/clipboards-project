Rails.application.routes.draw do
  root "home#index"
  # good clean routes, good use of helpers
  resources :orders
  resources :vendors
  resources :clipboards
  resources :inventorysheets
  resources :items
  devise_for :users

  get 'holiday', to: 'holiday#index', as: 'holiday_inventorysheets'
end
