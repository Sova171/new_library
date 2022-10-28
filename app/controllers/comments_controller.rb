# frozen_string_literal: true

class CommentsController < ApplicationController
  before_action :authenticate_user!, :find_book

  def create
    @comment = ::Comments::Create.call(comment_params:, book: @book)

    if @comment.valid?
      redirect_to book_path(@book)
    else
      redirect_to book_path(@book), alert: I18n.t('comments.invalid')
    end
  end

  private

  def find_book
    @book = Book.find(params[:book_id])
  end

  def comment_params
    params
      .require(:comment)
      .permit(:content)
      .merge(user_id: current_user.id)
  end
end
