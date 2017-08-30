class BooksController < ApplicationController

  def index
    @books = 
    if params[:q].present?
      results_title = Book.where('title ILIKE ?', "%#{params[:q]}%").order("title")
      results_author = Book.where('author ILIKE ?', "%#{params[:q]}%").order("title")
      results_genre = Book.where('genre ILIKE ?', "%#{params[:q]}%").order("title")
      results_classification = Book.where('classification ILIKE ?', "%#{params[:q]}%").order("title")
      results_book_type = Book.where('book_type ILIKE ?', "%#{params[:q]}%").order("title")
      results_title + results_author + results_genre + results_classification + results_book_type
    else
      Book.order("title")
    end
  end

  def new
    @book = Book.new
  end

  def create
    @book = Book.create(book_params)
    redirect_to root_path
  end

  def show
    @book = Book.find(params[:id])
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    @book = Book.find(params[:id])
    @book.update_attributes(book_params)
    redirect_to book_path(@book)
  end

  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    redirect_to root_path
  end

  private

  def book_params
    params.require(:book).permit(:title, :genre, :classification, :book_type, :year, :sub_title)
  end
end
