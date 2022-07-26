# frozen_string_literal: true

class FavoritesController < ApplicationController
  before_action :authenticate_user!
  before_action :find_book, only: %i[create destroy]

  def index
    @favorite_books = current_user.favorites.map(&:book)
  end

  def create
    current_user.follow_book(@book) unless current_user.following_book?(@book)
  end

  def destroy
    current_user.unfollow_book(@book)
  end

  private

  def find_book
    @book = Book.find(params[:book_id])
  end
end
