# frozen_string_literal: true

module Books
  class ShowFacade
    attr_reader :book, :current_user

    def initialize(book, current_user)
      @book = book
      @current_user = current_user
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

    def user_follow?(book)
      current_user.following_book?(book)
    end

    def user_rated?(book)
      current_user.already_rated?(book)
    end

    def lists
      @lists = current_user.lists.decorate
    end

    def book_title
      @book.title
    end

    def book_description
      @book.description
    end

    def book_pages_count
      @book.pages_count
    end

    def book_published_at
      @book.published_at
    end

    def book_publisher
      @book.publisher
    end

    def book_authors
      @book.authors
    end

    def book_cover
      @book.cover
    end
  end
end
