# frozen_string_literal: true

module Books
  class IndexFacade
    include Pagy::Backend
    attr_reader :page, :category

    DEFAULT_PAGE = 1

    def initialize(page:, category:)
      @page = page.presence || DEFAULT_PAGE
      @category = category
    end

    def paginate
      @paginate ||= pagination.first
    end

    def books
      @books ||= pagination.last
    end

    def categories
      Book.categories
    end

    private

    def pagination
      @pagination ||= pagy(all_books, page:)
    end

    def all_books
      if category.presence
        Book.where(category:)
      else
        Book.order(:created_at)
      end
    end
  end
end
