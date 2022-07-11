# frozen_string_literal: true

class ListsController < ApplicationController
  before_action :find_list, only: %i[show destroy]

  def index
    @lists = current_user.lists
  end

  def show
    @books = @list.books_lists.map(&:book)
  end

  def create
    @list = current_user.lists.create(list_params)
    redirect_to user_lists_path, notice: I18n.t('lists.create')
  end

  def destroy
    @list.destroy
    redirect_to user_lists_path, alert: I18n.t('lists.delete')
  end

  private

  def list_params
    params.require(:list).permit(:name)
  end

  def find_list
    @list = List.find(params[:id])
  end
end
