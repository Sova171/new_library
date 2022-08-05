# frozen_string_literal: true

class FavoritesController < ApplicationController
  before_action :authenticate_user!
  before_action :find_book, only: %i[create destroy]

  def index
    @facade = ::Favorites::IndexFacade.new(user)
  end

  def create
    ::Favorites::Create.call(book: @book, user:)
    redirect_back(fallback_location: root_path)
  end

  def destroy
    ::Favorites::Destroy.call(book: @book, user:)
    redirect_back(fallback_location: root_path)
  end

  private

  def find_book
    @book = Book.find(params[:book_id])
  end

  def user
    current_user.decorate
  end
end
