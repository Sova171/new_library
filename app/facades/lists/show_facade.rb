# frozen_string: true

module Lists
  class ShowFacade
    attr_reader :list

    def initialize(list)
      @list = list
    end

    def books_list
      @books = @list.books_lists.map(&:book)
    end

    def list_name
      @list.name
    end
  end
end
