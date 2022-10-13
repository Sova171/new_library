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
      @pagination ||= pagy_searchkick(results, page:)
    end

    def results
      return results_by_category if category.presence

      Book.pagy_search('*', order: { created_at: :desc })
    end

    def results_by_category
      Book.pagy_search(category, fields: [:category])
    end
  end
end
