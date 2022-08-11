# frozen_string_literal: true

module BooksLists
  class Destroy < ::Callable
    def initialize(book:, list:)
      @book = book
      @list = list
    end

    def call
      list.books_lists.find_by(book_id: book.id).destroy
    end

    private

    attr_reader :book, :list
  end
end
