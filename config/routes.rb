Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root "welcome#index"

  get "/login", to: "sessions#new"
  post "/login", to: "sessions#create"
  get "/dashboard", to: "users#show"
  get '/cart', to: "carts#show"
  delete '/carts', to: "carts#destroy"
  post '/cart/add_item', to: "carts#add_item"
  post '/cart/subtract_item', to: "carts#subtract_item"

  resources :users, only:[:new, :create, :show]

  resources :items, only: [:index, :show]

  resources :carts, only: [:create, :show, :update]


  resources :categories, :path => "/", :only => [:show]

end
