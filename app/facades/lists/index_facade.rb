# frozen_string: true

module Lists
  class IndexFacade
    attr_reader :current_user

    def initialize(current_user)
      @current_user = current_user
    end

    def lists
      @lists = current_user.lists
    end
  end
end
