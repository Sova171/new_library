# frozen_string_literal: true

module Favorites
  class IndexFacade
    attr_reader :user

    def initialize(user:)
      @user = user
    end

    def favorites_books
      @favorites_books ||= user.favorites.map(&:book)
    end
  end
end
