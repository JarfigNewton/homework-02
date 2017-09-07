class BooksController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]

  def index
    @books = 
    if params[:q].present?
      results_book = Book.where('title ILIKE ? OR genre ILIKE ? OR classification ILIKE ? OR book_type ILIKE ? OR sub_title ILIKE ?', "%#{params[:q]}%", "%#{params[:q]}%", "%#{params[:q]}%", "%#{params[:q]}%", "%#{params[:q]}%").order("title")
      results_author = Author.where('first_name ILIKE ? OR last_name ILIKE ?', "%#{params[:q]}%", "%#{params[:q]}%").all
      books_by_authors = []
      results_author.each do |author|
        author_books = author.books
        author_books.each do |book|
          books_by_authors << book
        end
      end

      results_book + books_by_authors
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
    @authors = @book.authors
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
