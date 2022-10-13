# frozen_string_literal: true

module RatingBooks
  class Create < ::Callable
    def initialize(book:, user:, rating:)
      @book   = book
      @user   = user
      @rating = rating
    end

    def call
      update_rating_count
      create_rating_book
    end

    private

    attr_reader :book, :user, :rating

    def create_rating_book
      user.rating_books.find_by(book:).destroy if book.rated_by?(user)
      user.rating_books.create(book:, rating:)
    end

    def update_when_rated
      rating = RatingBook.find_by(book:, user:)
      rate_count = RatingCount.find_by(book_id: book.id, rating_id: rating.rating_id)
      rate_count&.update_attribute(:counts, rate_count.counts -= 1)
    end

    def update_rating_count
      update_when_rated if book.rated_by?(user)
      rate_count = RatingCount.find_by(book_id: book.id, rating_id: rating)
      rate_count&.update_attribute(:counts, rate_count.counts += 1)
    end
  end
end
