# frozen_string_literal: true

module Authors
  class IndexFacade
    def authors
      @authors = Author.order(:created_at)
    end
  end
end
