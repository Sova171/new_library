# frozen_string_literal: true

module Authors
  class ShowFacade
    attr_reader :author

    def initialize(author)
      @author = author
    end

    def author_name
      @author.full_name
    end

    def author_birth
      @author.date_of_birth
    end

    def author_biography
      @author.biography
    end

    def author_books
      @author.books
    end

    def author_avatar
      @author.avatar
    end
  end
end
