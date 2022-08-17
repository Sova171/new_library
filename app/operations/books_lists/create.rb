# frozen_string_literal: true

module BooksLists
  class Create < ::Callable
    def initialize(book:, list:)
      @book = book
      @list = list
    end

    def call
      list.books_lists.create(book_id: book.id)
    end

    private

    attr_reader :book, :list
  end
end
