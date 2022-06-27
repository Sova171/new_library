Rails.application.routes.draw do
  devise_for :users

  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end

  root "books#index"

  resources :books
  resources :authors
  get "/search", to: "books#search"

  #resource :favorite, only: [ :index, :create, :destroy ]
  get "/favorites/:id", to: "favorites#destroy"
  get "/favorites", to: "favorites#create"
  get "/favorite_books", to: "favorites#index"
end
