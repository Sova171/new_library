# frozen_string_literal: true

class BooksController < ApplicationController
  before_action :find_book, only: :show

  def index
    @facade = ::Books::IndexFacade.new(
      page:     params[:page],
      category: params[:category]
    )
  end

  def show
    @facade = ::Books::ShowFacade.new(
      book: @book.decorate,
      user: current_user
    )
  end

  private

  def find_book
    @book = Book.find(params[:id])
  end

  def book_params
    params.require(:book).permit(:title, :description, :category, :pages_count,
                                 :published_at, :publisher, :cover, author_ids: [])
  end
end
