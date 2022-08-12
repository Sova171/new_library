# frozen_string_literal: true

module Books
  class IndexFacade
    include Pagy::Backend
    attr_reader :page

    def initialize(page:)
      @page = page.nil? ? 1 : page
      # @page = page || 1
    end

    def paginate
      @paginate ||= pagination.first
    end

    def books
      @books ||= pagination.last
    end

    private

    def pagination
      @pagination = pagy(all_books, page:)
    end

    def all_books
      Book.order(:created_at)
    end
  end
end
