# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :users, controllers: { omniauth_callbacks: 'omniauth', registrations: 'users/registrations' }

  root 'books#index'

  resources :books, only: %i[index show] do
    resource :favorites, only: %i[create destroy]
  end

  resources :books, only: [:show] do
    resource :comments
  end

  resources :authors, only: %i[index show]

  resources :users do
    resources :lists
  end

  scope module: :books do
    resources :searches, only: %i[index]
  end

  resources :favorites, only: :index
  resources :books_lists, only: %i[create destroy]
  resources :rating_books, only: %i[create destroy]
end
