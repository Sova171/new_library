class FavoritesController < ApplicationController
  before_action :find_book, only: [:create, :destroy]

  def index
    @favorite_books = Favorite.all.where(user_id: current_user.id)
  end

  def create
    current_user.follow_book(@book)
    redirect_back(fallback_location:"/")
  end

  def destroy
    current_user.unfollow_book(@book)
    redirect_back(fallback_location:"/")
  end

  private

  def find_book
    @book = Book.find(params[:id])
  end
end
