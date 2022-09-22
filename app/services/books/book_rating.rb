# frozen_string_literal: true

module Books
  class BookRating < ::Callable
    def initialize(book:)
      @book = book
    end

    def call
      votes = {}
      Rating.all.each do |vote|
        votes[vote.title] = RatingBook.where(book:, rating: vote).count
      end
      votes
    end

    private

    attr_accessor :book
  end
end
