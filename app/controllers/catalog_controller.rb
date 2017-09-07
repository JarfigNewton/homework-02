class CatalogController < ApplicationController

  def index
    @books = 
    if params[:q].present?
      results_book = Book.where('title ILIKE ?', "%#{params[:q]}%").order("title")
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

end
