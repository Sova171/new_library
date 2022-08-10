# frozen_string_literal: true

class BooksController < ApplicationController
  before_action :find_book, only: :show

  def index
    @facade = ::Books::IndexFacade.new(params: params[:page])
  end

  def show
    @facade = ::Books::ShowFacade.new(book: @book)
  end

  def search
    if params[:search].blank?
      redirect_to root_path
    else
      @parameter = params[:search].downcase
      @results = Book.search(@parameter, fields: [{ title: :text_middle }], misspellings: false)
    end
  end

  private

  def find_book
    @book = Book.find(params[:id])
  end

  def book_params
    params.require(:book).permit(:title, :description, :pages_count,
                                 :published_at, :publisher, :cover, author_ids: [])
  end
end
