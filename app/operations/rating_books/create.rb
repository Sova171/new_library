# frozen_string_literal: true

module RatingBooks
  class Create < ::Callable
    def initialize(user:, book:, rating:)
      @user = user
      @book = book
      @rating = rating
    end

    def call
      user.delete_rating(book) if user.already_rated?(book)
      user.rate_book(book, rating)
    end

    private

    attr_reader :user, :book, :rating
  end
end
