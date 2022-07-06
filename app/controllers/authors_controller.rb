class AuthorsController < ApplicationController
  before_action :find_author, only: %i[show edit destroy update]

  def index
    @authors = Author.all.order(:created_at)
  end

  def show; end

  def new
    @author = Author.new
  end

  def create
    @author = Author.new(author_params)

    if @author.save
      redirect_to @author
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit; end

  def update
    if @author.update(author_params)
      redirect_to @author
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @author.destroy

    redirect_to authors_path, status: :see_other
  end

  private

  def find_author
    @author = Author.find(params[:id])
  end

  def author_params
    params.require(:author).permit(:full_name, :birthdate, :biography, :avatar, book_ids: [])
  end

end
