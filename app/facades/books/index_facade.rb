# frozen_string_literal: true

module Books
  class IndexFacade
    include Pagy::Backend
    attr_reader :page

    DEFAULT_PAGE = 1

    def initialize(page:)
      @page = page.presence || DEFAULT_PAGE
    end

    def paginate
      @paginate ||= pagination.first
    end

    def books
      @books ||= pagination.last
    end

    private

    def pagination
      @pagination ||= pagy(all_books, page:)
    end

    def all_books
      Book.order(:created_at)
    end
  end
end
