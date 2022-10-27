class CommentsController < ApplicationController
  before_action :authenticate_user!, :find_book

  def create
    @comment = ::Comments::Create.call(comment: @comment, book: @book, comment_params:, user: current_user)

    redirect_to book_path(@book) if @comment.save
  end

  private

  def find_book
    @book = Book.find(params[:book_id])
  end

  def comment_params
    params.require(:comment).permit(:content)
  end
end
