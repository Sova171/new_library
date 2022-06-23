class BooksController < ApplicationController

  def index
    @books = Book.all.order('created_at')
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

  def edit
    @book = Book.find(params[:id])
  end

  def update
    @book = Book.find(params[:id])

    if @book.update(book_params)
      redirect_to @book
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @book = Book.find(params[:id])
    @book.destroy

    redirect_to root_path, status: :see_other
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
    params.require(:book).permit(:title, :description, :pages_count, :published_at, :publisher, :cover)
  end

end
