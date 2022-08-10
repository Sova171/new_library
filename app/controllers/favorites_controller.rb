# frozen_string_literal: true

class FavoritesController < ApplicationController
  before_action :authenticate_user!
  before_action :find_book, only: %i[create destroy]

  def index
    @facade = ::Favorites::IndexFacade.new(user: current_user)
  end

  def create
    current_user.follow_book(@book)
    redirect_back(fallback_location: root_path)
  end

  def destroy
    current_user.unfollow_book(@book)
    redirect_back(fallback_location: root_path)
  end

  private

  def find_book
    @book = Book.find(params[:book_id])
  end
end
