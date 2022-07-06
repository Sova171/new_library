# frozen_string_literal: true

class RatingBooksController < ApplicationController
  before_action :find_book, :find_rating

  def create
    if current_user.already_rating?(@book)
      destroy
      current_user.rating_book(@book, @rating)
    else
      current_user.rating_book(@book, @rating)
      redirect_to book_path(@book)
    end
  end

  def destroy
    current_user.unrating_book(@book)
    redirect_to book_path(@book)
  end

  def find_book
    @book = Book.find(params[:id])
  end

  def find_rating
    @rating = Rating.find(params[:rating_id])
    @rating = @rating.id
  end
end
