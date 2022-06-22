Rails.application.routes.draw do
  devise_for :users

  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end

  root "books#index"

  resources :books
  resources :authors
  get "/search", to: "books#search"
end
