Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root "welcome#index"

  get "/login", to: "sessions#new"
  post "/login", to: "sessions#create"
  delete "/logout", to: "sessions#destroy"
  get "/dashboard", to: "users#show"
  get '/cart', to: "carts#show"
  delete '/carts', to: "carts#destroy"
  post '/cart/add_item', to: "carts#add_item"
  post '/cart/subtract_item', to: "carts#subtract_item"

  resources :users, only:[:new, :create, :show, :edit, :update] do
    resources :orders, only: [:create, :show, :index]
  end

  resources :items, only: [:index, :show]

  resources :carts, only: [:create, :show, :update]

  get '/:category',  to: 'categories#show', param: :slug, as: "category"

  namespace :admin do
    resources :users, only: [:show, :edit, :update]
    get "/dashboard", to: "users#show"
    delete "/dashboard", to: "users#destroy"
    post "/dashboard", to: "users#update"
    get '/analytics-dashboard', to: "analytics#show"
    patch '/items', to: "items#retire"
    resources :items, only: [:index, :new, :create, :edit, :update, :destroy]
  end
end
