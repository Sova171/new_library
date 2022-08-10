# frozen_string_literal: true

module Books
  class ShowFacade
    attr_reader :book

    def initialize(book:)
      @book = book
    end

    delegate :title, :description, :pages_count, :published_at,
             :publisher, :authors, :cover, to: :book, prefix: true
  end
end
