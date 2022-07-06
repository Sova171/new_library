# frozen_string_literal: true

class FavoritesController < ApplicationController
  before_action :find_book, only: %i[create destroy]

  def index
    @favorite_books = Favorite.all.where(user_id: current_user.id)
  end

  def create
    if !user_signed_in?
      redirect_to new_user_session_path, notice: 'You need to be signed in'
    else
      current_user.follow_book(@book)
      redirect_back(fallback_location: '/')
    end
  end

  def destroy
    current_user.unfollow_book(@book)
    redirect_back(fallback_location: '/')
  end

  private

  def find_book
    @book = Book.find(params[:id])
  end
end
