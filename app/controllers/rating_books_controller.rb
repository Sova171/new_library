# frozen_string_literal: true

class RatingBooksController < ApplicationController
  before_action :find_book, :find_rating

  def create
    if current_user.already_rated?(@book)
      destroy
      current_user.rate_book(@book, @rating.id)
    else
      current_user.rate_book(@book, @rating.id)
      redirect_to book_path(@book)
    end
  end

  def destroy
    current_user.delete_rating(@book)
    redirect_to book_path(@book)
  end

  private

  def find_book
    @book = Book.find(params[:id])
  end

  def find_rating
    @rating = Rating.find(params[:rating_id])
  end
end
