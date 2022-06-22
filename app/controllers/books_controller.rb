class BooksController < ApplicationController

  def index
    @books = Book.all
  end

  def show
    @book = Book.find(params[:id])
  end

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

  def search
    if params[:search].blank?
      redirect_to root_path and return
    else
      @parameter = params[:search].downcase
      @results = Book.all.where("lower(title) LIKE :search", search: "%#{@parameter}%")
    end
  end

  private

  def book_params
    params.require(:book).permit(:title, :description, :pages_count, :published_at, :publisher)
  end

end
