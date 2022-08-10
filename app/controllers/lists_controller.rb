# frozen_string_literal: true

class ListsController < ApplicationController
  before_action :find_list, only: %i[show destroy]

  def index
    @facade = ::Lists::IndexFacade.new(user: current_user) # check
  end

  def show
    @facade = ::Lists::ShowFacade.new(list: @list)
  end

  def new
    @list = current_user.lists.build
  end

  def create
    @list = current_user.lists.build list_params
    if @list.save
      redirect_to user_lists_path, notice: I18n.t('lists.create')
    else
      render :new, status: :unprocessable_entity
    end
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
