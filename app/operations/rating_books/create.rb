# frozen_string_literal: true

module RatingBooks
  class Create < ::Callable
    def initialize(book:, user:, rating:)
      @book = book
      @user = user
      @rating = rating
    end

    def call
      user.rating_books.find_by(book_id: book.id).destroy if user.already_rated?(book)
      user.rating_books.create(book_id: book.id, rating_id: rating.id)
    end

    private

    attr_reader :book, :user, :rating
  end
end
