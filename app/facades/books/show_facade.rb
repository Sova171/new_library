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
      counter = Rating.first.id
      votes = {}
      rating = RatingBook.where(book_id: book.id)
      Rating.all.each do |vote|
        votes[vote.title] = rating.where(rating_id: counter).count
        counter += 1
      end
      votes
    end

    delegate :title, :description, :pages_count, :published_at,
             :publisher, :authors, :cover, to: :book, prefix: true
  end
end
