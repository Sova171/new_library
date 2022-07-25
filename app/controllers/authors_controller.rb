# frozen_string_literal: true

class AuthorsController < ApplicationController
  before_action :find_author, only: :show

  def index
    @authors = Author.all.order(:created_at)
  end

  def show; end

  private

  def find_author
    @author = Author.find(params[:id])
  end

  def author_params
    params.require(:author).permit(:full_name, :date_of_birth, :biography, :avatar, book_ids: [])
  end
end
