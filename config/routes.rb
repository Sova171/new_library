# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :users, controllers: { omniauth_callbacks: 'omniauth' }

  root 'books#index'

  resources :books, only: %i[index show] do
    resource :favorites, only: %i[create destroy]
  end
  resources :authors, only: %i[index show]

  resources :users do
    resources :lists
  end

  get '/search', to: 'books#search'

  resources :favorites, only: :index
  resources :books_lists, only: %i[create destroy]
  resources :rating_books, only: %i[create destroy]
end
