class ListsController < ApplicationController
  before_action :find_list, only: [:show, :destroy]

  def index
    @lists = List.all.where(user_id: current_user.id)
  end

  def show
    @books_ids = BooksList.all.where(list_id: @list.id)
  end

  def create
    @user = User.find(params[:user_id])
    @list = @user.lists.create(list_params)
    redirect_to user_lists_path, notice: "List was successfully created."
  end

  def destroy
    @list.destroy
    redirect_to user_lists_path, alert: "List was successfully destroyed."
  end

  private

  def list_params
    params.require(:list).permit(:name)
  end

  def find_list
    @list = List.find(params[:id])
  end

end
