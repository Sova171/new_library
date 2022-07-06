# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users

  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end

  root 'books#index'

  resources :books
  resources :authors

  resources :users do
    resources :lists
  end

  get '/search', to: 'books#search'

  get '/favorites/:id', to: 'favorites#destroy'
  get '/favorites', to: 'favorites#create'
  get '/favorite_books', to: 'favorites#index'

  get '/books_lists/:id', to: 'books_lists#destroy'
  get '/books_lists', to: 'books_lists#create'

  get '/rating_books/:id', to: 'rating_books#destroy'
  get '/rating_books', to: 'rating_books#create'
end
