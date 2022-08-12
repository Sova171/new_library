# frozen_string_literal: true

class RatingBooksController < ApplicationController
  before_action :find_book, :find_rating

  def create
    ::RatingBooks::Create.call(user: current_user, book: @book.decorate, rating: @rating)
    redirect_to book_path(@book)
  end

  def destroy
    ::RatingBooks::Destroy.call(user: current_user, book: @book)
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
