# frozen_string_literal: true

module Books
  class IndexFacade
    include Pagy::Backend
    attr_reader :page, :category, :rating

    DEFAULT_PAGE = 1

    def initialize(page:, category:, rating:)
      @page     = page.presence || DEFAULT_PAGE
      @rating   = rating
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

    def ratings
      Rating.all
    end

    private

    def pagination
      @pagination ||= pagy_searchkick(results, page:)
    end

    def results
      return results_by_category if category.presence
      return results_by_rating if rating.presence

      Book.pagy_search('*', order: { created_at: :desc })
    end

    def results_by_category
      Book.pagy_search(category, fields: [:category])
    end

    def results_by_rating
      Book.reindex
      Book.pagy_search('*', where: { book_rating_id: rating }, order: { book_count: :desc })
    end
  end
end
