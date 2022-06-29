class ListsController < ApplicationController
  def index
    @lists = List.all.where(user_id: current_user.id)
  end

  def show
    @list = List.find(params[:id])
  end

  def create
    @user = User.find(params[:user_id])
    @list = @user.lists.create(list_params)
    redirect_to user_lists_path, notice: "List was successfully created."
  end

  def destroy
    @list = List.find(params[:id])
    @list.destroy
    redirect_to user_lists_path, alert: "List was successfully destroyed."
  end

  private
  def list_params
    params.require(:list).permit(:name)
  end
end
