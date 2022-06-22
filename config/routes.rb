Rails.application.routes.draw do

  root "books#index"

  #get "/books/:id", to: "books#show"
  resources :books
  get "/search", to: "books#search"
end
