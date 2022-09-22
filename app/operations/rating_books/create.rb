# frozen_string_literal: true

module RatingBooks
  class Create < ::Callable
    def initialize(book:, user:, rating:)
      @book = book
      @user = user
      @rating = rating
    end

    def call
      user.rating_books.find_by(book:).destroy if book.rated_by?(user)
      user.rating_books.create(book:, rating:)
    end

    private

    attr_reader :book, :user, :rating
  end
end
