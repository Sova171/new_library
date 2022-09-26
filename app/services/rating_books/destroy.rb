# frozen_string_literal: true

module RatingBooks
  class Destroy < ::Callable
    def initialize(book:, user:)
      @book = book
      @user = user
    end

    def call
      user.rating_books.find_by(book:).destroy
    end

    private

    attr_reader :book, :user
  end
end
