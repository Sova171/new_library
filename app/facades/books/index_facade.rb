# frozen_string_literal: true

module Books
  class IndexFacade
    include Pagy::Backend
    attr_reader :params, :paginate, :books

    def initialize(params = 1)
      @params = params
      pagination
    end

    private

    def pagination
      @paginate, @books = pagy(all_books, page: params[:params])
    end

    def all_books
      Book.order(:created_at)
    end
  end
end
