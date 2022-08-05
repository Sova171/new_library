# frozen_string_literal: true

module BooksLists
  class Destroy < ::Callable
    def initialize(book:, list:)
      @book = book
      @list = list
    end

    def call
      list.delete_book_from_list(book)
    end

    private

    attr_reader :book, :list
  end
end
