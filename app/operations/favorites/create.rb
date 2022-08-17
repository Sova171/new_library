# frozen_string_literal: true

module Favorites
  class Create < ::Callable
    def initialize(book:, user:)
      @book = book
      @user = user
    end

    def call
      user.favorites.create(book_id: book.id)
    end

    private

    attr_reader :book, :user
  end
end
