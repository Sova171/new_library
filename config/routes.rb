# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users

  root 'books#index'

  resources :books do
    resource :favorites, only: %i[create destroy]
  end
  resources :authors

  resources :users do
    resources :lists
  end

  get '/search', to: 'books#search'

  resources :favorites, only: :index
  resources :books_lists, only: %i[create destroy]
  resources :rating_books, only: %i[create destroy]
end
