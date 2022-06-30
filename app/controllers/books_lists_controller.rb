class BooksListsController < ApplicationController
  before_action :find_book, :find_list

  def create
    @list.add_book_to_list(@book)
    if @list.book_in_list?(@book)
      flash[:notice] = "#{@book.title} was added to list #{@list.name}"
    end
    redirect_back(fallback_location:"/")
  end

  def destroy
    @list.delete_book_from_list(@book)
    unless @list.book_in_list?(@book)
      flash[:notice] = "#{@book.title} was deleted from list #{@list.name}"
    end
    redirect_back(fallback_location:"/")
  end

  def find_book
    @book = Book.find(params[:id])
  end

  def find_list
    @list = List.find(params[:list_id])
  end
end
