Rails.application.routes.draw do
  devise_for :users

  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end

  root "books#index"

  #get "/books/:id", to: "books#show"
  resources :books
  get "/search", to: "books#search"
end
