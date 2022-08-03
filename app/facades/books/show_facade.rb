# frozen_string_literal: true

module Books
  class ShowFacade
    attr_reader :book

    def initialize(book)
      @book = book
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
