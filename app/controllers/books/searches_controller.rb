# frozen_string_literal: true

module Books
  class SearchesController < ApplicationController
    def index
      if params[:search].blank?
        redirect_to root_path
      else
        @results = ::Books::Search.call(search: params[:search])
      end
    end
  end
end
