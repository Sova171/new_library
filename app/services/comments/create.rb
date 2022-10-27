# frozen_string_literal: true

module Comments
  class Create < ::Callable
    def initialize(comment:, comment_params:, book:, user:)
      @user           = user
      @book           = book
      @comment        = comment
      @comment_params = comment_params
    end

    def call
      @comment = book.comments.create(comment_params)
      @comment.user = user

      @comment
    end

    attr_reader :book, :user, :comment, :comment_params
  end
end
