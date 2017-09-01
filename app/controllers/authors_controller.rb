class AuthorsController < ApplicationController

  def new
    @author = Author.new
  end

  def create
    @author = Author.create(author_params)
    redirect_to root_path
  end

  def show
    @author = Author.find(params[:id])
    @books = @author.books
  end

  def edit
    @author = Author.find(params[:id])
  end

  def update
    @author = Author.find(params[:id])
    @author.update_attributes(author_params)
    redirect_to author_path(@author)
  end

  def destroy
    @author = Author.find(params[:id])
    @author.destroy
    redirect_to root_path
  end

  private

  def author_params
    params.require(:author).permit(:first_name, :last_name, :age)
  end

end
