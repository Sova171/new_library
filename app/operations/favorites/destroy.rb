# frozen_string_literal: true

module Favorites
  class Destroy < ::Callable
    def initialize(book:, user:)
      @book = book
      @user = user
    end

    def call
      user.favorites.find_by(book_id: book.id).destroy
    end

    private

    attr_reader :book, :user
  end
end
