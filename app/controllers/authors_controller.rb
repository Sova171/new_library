# frozen_string_literal: true

class AuthorsController < ApplicationController
  before_action :find_author, only: :show

  def index
    @facade = ::Authors::IndexFacade.new
  end

  def show
    @facade = ::Authors::ShowFacade.new(author: @author)
  end

  private

  def find_author
    @author = Author.find(params[:id])
  end

  def author_params
    params.require(:author).permit(:full_name, :date_of_birth, :biography, :avatar, book_ids: [])
  end
end
