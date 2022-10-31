# frozen_string_literal: true

module Comments
  class Create < ::Callable
    def initialize(comment_params:, book:)
      @book           = book
      @comment_params = comment_params
    end

    def call
      book.comments.create(comment_params)
    end

    attr_reader :book, :comment_params
  end
end
