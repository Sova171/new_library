# frozen_string_literal: true

module Books
  class IndexFacade
    include Pagy::Backend
    attr_reader :page, :category, :rating

    DEFAULT_PAGE = 1

    def initialize(page:, category:, rating:)
      @page = page.presence || DEFAULT_PAGE
      @category = category
      @rating = rating
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
      @pagination ||= pagy(all_books, page:)
    end

    def all_books
      if category.presence
        Book.where(category:)
      elsif rating.presence
        sorted_books
      else
        Book.order(:created_at)
      end
    end

    def query_ratings
      Book
        .joins(:rating_books)
        .where(rating_books: { rating_id: rating })
        .group(:id)
        .count
    end

    def sorted_books
      ids = []
      sorted = query_ratings.sort_by { |k, v| -v }
      sorted.each { |k, v| ids.push(k) }
      Book.where(id: ids).in_order_of(:id, ids)
    end
  end
end
