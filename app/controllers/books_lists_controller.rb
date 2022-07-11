# frozen_string_literal: true

class BooksListsController < ApplicationController
  before_action :find_book, :find_list

  def create
    @list.add_book_to_list(@book)
    flash[:notice] = I18n.t('books_lists.add_book', list: @list.name, book: @book.title)
    redirect_back(fallback_location: 'root_path')
  end

  def destroy
    @list.delete_book_from_list(@book)
    flash[:notice] = I18n.t('books_lists.delete_book', list: @list.name, book: @book.title)
    redirect_back(fallback_location: 'root_path')
  end

  def find_book
    @book = Book.find(params[:book_id])
  end

  def find_list
    @list = List.find(params[:list_id])
  end
end
