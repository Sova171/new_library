# frozen_string_literal: true

class BooksController < ApplicationController
  before_action :find_book, only: %i[show edit destroy update]

  def index
    @pagy, @books = pagy(Book.all.order(:created_at))
  end

  def show; end

  def new
    @book = Book.new
  end

  def create
    @book = Book.new(book_params)

    if @book.save
      redirect_to @book
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit; end

  def update
    if @book.update(book_params)
      redirect_to @book
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @book.destroy

    redirect_to root_path, status: :see_other
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
