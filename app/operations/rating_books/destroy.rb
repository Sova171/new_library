# frozen_string_literal: true

module RatingBooks
  class Destroy < ::Callable
    def initialize(user:, book:)
      @user = user
      @book = book
    end

    def call
      user.delete_rating(book)
    end

    private

    attr_reader :user, :book
  end
end
