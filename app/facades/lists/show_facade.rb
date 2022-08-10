# frozen_string: true

module Lists
  class ShowFacade
    attr_reader :list

    def initialize(list:)
      @list = list
    end

    delegate :name, :books, to: :list, prefix: true
  end
end
