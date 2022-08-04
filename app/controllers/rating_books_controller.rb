# frozen_string_literal: true

class RatingBooksController < ApplicationController
  before_action :find_book, :find_rating

  def create
    if user.already_rated?(@book)
      destroy
      user.rate_book(@book, @rating.id)
    else
      user.rate_book(@book, @rating.id)
      redirect_to book_path(@book)
    end
  end

  def destroy
    user.delete_rating(@book)
    redirect_to book_path(@book)
  end

  private

  def find_book
    @book = Book.find(params[:id])
  end

  def find_rating
    @rating = Rating.find(params[:rating_id])
  end

  def user
    current_user.decorate
  end
end
