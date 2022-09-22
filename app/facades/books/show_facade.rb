# frozen_string_literal: true

module Books
  class ShowFacade
    attr_reader :book, :user

    def initialize(book:, user:)
      @book = book
      @user = user
    end

    def lists
      user.lists.decorate
    end

    def book_rating
      ::Books::BookRating.call(book:)
    end

    delegate :title, :description, :pages_count, :published_at,
             :publisher, :authors, :cover, to: :book, prefix: true
  end
end
