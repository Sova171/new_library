# frozen_string_literal: true

module Books
  class IndexFacade
    def books
      @books = Book.all.order(:created_at)
    end
  end
end
