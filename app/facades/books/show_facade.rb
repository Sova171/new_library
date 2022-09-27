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
      Rating
        .joins(:rating_books)
        .where(rating_books: { book: })
        .group(:title)
        .count
    end

    delegate :title, :description, :pages_count, :published_at,
             :publisher, :authors, :cover, :category, to: :book, prefix: true
  end
end
