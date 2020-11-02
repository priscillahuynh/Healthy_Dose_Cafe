Rails.application.routes.draw do
  get '/' => 'sessions#welcome'
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'

  get '/signup' => 'users#new'
  delete '/logout' => 'sessions#destroy'

  get '/carts/:id' => "carts#show", as: "cart"
  delete '/carts/:id' => "carts#destroy"

  post 'line_items/:id/add' => "line_items#add_quantity", as: "add_line_item"
  post 'line_items/:id/reduce' => "line_items#reduce_quantity", as: "reduce_line_item"

  resources :products
  resources :categories, :path => "menu" do
    resources :products, only: [:new, :show, :index, :destroy]
  end

  resources :orders
  resources :line_items
  resources :users 

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
