class AlterBooksAddBookType < ActiveRecord::Migration[5.0]
  def change
    add_column :books, :book_type, :string
  end
end
