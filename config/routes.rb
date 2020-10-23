Rails.application.routes.draw do
  get '/' => 'sessions#welcome'
  resources :categories
  resources :orders
  resources :line_items
  resources :carts
  resources :products
  resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
