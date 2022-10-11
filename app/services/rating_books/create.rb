# frozen_string_literal: true

module RatingBooks
  class Create < ::Callable
    def initialize(book:, user:, rating:)
      @book = book
      @user = user
      @rating = rating
    end

    def call
      create_rating_book
      update_rating_count
    end

    private

    attr_reader :book, :user, :rating

    def create_rating_book
      user.rating_books.find_by(book:).destroy if book.rated_by?(user)
      user.rating_books.create(book:, rating:)
    end

    def update_rating_count
      rate_count = RatingCount.find_by(book_id: book.id, rating_id: rating)
      rate_count.update_attribute(:count, rate_count.count += 1)
    end
  end
end
