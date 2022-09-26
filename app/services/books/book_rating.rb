# frozen_string_literal: true

module Books
  class BookRating < ::Callable
    def initialize(book:)
      @book = book
    end

    def call
      Rating
        .joins(:rating_books)
        .where(rating_books: { book: })
        .group(:title)
        .count
    end

    private

    attr_accessor :book
  end
end
