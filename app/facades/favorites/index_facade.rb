# frozen_string_literal: true

module Favorites
  class IndexFacade
    attr_reader :current_user

    def initialize(current_user)
      @current_user = current_user
    end

    def favorites_books
      @favorites_books = current_user.favorites.map(&:book)
    end
  end
end
