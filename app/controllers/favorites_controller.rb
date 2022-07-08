# frozen_string_literal: true

class FavoritesController < ApplicationController
  before_action :authenticate_user!
  before_action :find_book, only: %i[create destroy]

  def index
    #@favorite_books = []
    @favorite_books = current_user.favorites.map(&:book)
    #@books.each { |book| @favorite_books.push(Book.find(book)) }
  end

  def create
    if current_user.following_book?(@book)
      redirect_to book_path(@book)
    else
      current_user.follow_book(@book)
      redirect_back(fallback_location: 'root_path')
    end
  end

  def destroy
    current_user.unfollow_book(@book)
    redirect_back(fallback_location: 'root_path')
  end

  private

  def find_book
    @book = Book.find(params[:book_id])
  end
end
