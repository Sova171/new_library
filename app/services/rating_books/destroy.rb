# frozen_string_literal: true

module RatingBooks
  class Destroy < ::Callable
    def initialize(book:, user:)
      @book = book
      @user = user
    end

    def call
      update_rating_count
      user.rating_books.find_by(book:).destroy
    end

    private

    attr_reader :book, :user

    def find_rating
      rating = RatingBook.find_by(book:, user:)
      rating.rating_id
    end

    def update_rating_count
      rate_count = RatingCount.find_by(book_id: book.id, rating_id: find_rating)
      rate_count&.update_attribute(:counts, rate_count.counts -= 1)
    end
  end
end
