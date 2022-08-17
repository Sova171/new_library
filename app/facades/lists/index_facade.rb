# frozen_string_literal: true

module Lists
  class IndexFacade
    attr_reader :user

    def initialize(user:)
      @user = user
    end

    def lists
      @lists ||= user.lists
    end
  end
end
