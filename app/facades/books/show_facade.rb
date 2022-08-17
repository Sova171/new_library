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

    def book_rating(book)
      votes = {}
      Rating.all.each do |vote|
        votes[vote.title] = RatingBook.where(book_id: book.id, rating_id: vote.id).count
      end
      votes
    end

    delegate :title, :description, :pages_count, :published_at,
             :publisher, :authors, :cover, to: :book, prefix: true
  end
end
