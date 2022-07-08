# frozen_string_literal: true

class ListsController < ApplicationController
  before_action :find_list, only: %i[show destroy]

  def index
    @lists = current_user.lists
  end

  def show
    @books = []
    @books_id = @list.books_lists.map(&:book_id)
    @books_id.each { |book| @books.push(Book.find(book)) }
  end

  def create
    @list = current_user.lists.create(list_params)
    redirect_to user_lists_path, notice: I18n.t('books_lists.create.success_message')
  end

  def destroy
    @list.destroy
    redirect_to user_lists_path, alert: I18n.t('books_lists.delete.destroy_message')
  end

  private

  def list_params
    params.require(:list).permit(:name)
  end

  def find_list
    @list = List.find(params[:id])
  end
end
