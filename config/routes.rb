Rails.application.routes.draw do
  get '/' => 'sessions#welcome'
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  get '/signup' => 'users#new'
  delete '/logout' => 'sessions#destroy'
  
  resources :products
  resources :categories, :path => "menu" do
    resources :products, only: [:new, :show, :index]
  end
  resources :orders
  resources :line_items
  resources :carts
  resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
