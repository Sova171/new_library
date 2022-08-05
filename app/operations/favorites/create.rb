# frozen_string_literal: true

module Favorites
  class Create < ::Callable
    def initialize(book:, user:)
      @book = book
      @user = user
    end

    def call
      user.follow_book(book)
    end

    private

    attr_reader :user, :book
  end
end
