# frozen_string_literal: true

module Books
  class Search < ::Callable
    def initialize(search:)
      @search = search
    end

    def call
      Book.search(search, fields: [{ title: :text_middle }], misspellings: false)
    end

    private

    attr_reader :search
  end
end
