# frozen_string_literal: true

module Books
  class BookRating < ::Callable
    def initialize(book:)
      @book = book
    end

    def call
      votes = {}
      table = Rating
              .select('ratings.title, count(ratings)')
              .joins('LEFT JOIN rating_books ON ratings.id = rating_books.rating_id')
              .where('rating_books.book_id = ?', book)
              .group('rating_id, ratings.title')

      table.each { |record| votes[record.title] = record.count }
      votes
    end

    private

    attr_accessor :book
  end
end
