# frozen_string_literal: true

module Authors
  class ShowFacade
    attr_reader :author

    def initialize(author:)
      @author = author
    end

    delegate :full_name, :date_of_birth, :books, :biography, :avatar, to: :author, prefix: true
  end
end
