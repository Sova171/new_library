# frozen_string_literal: true

module BooksLists
  class Create < ::Callable
    def initialize(book:, list:)
      @book = book
      @list = list
    end

    def call
      list.add_book_to_list(book)
    end

    private

    attr_reader :book, :list
  end
end
