class CreateBooks < ActiveRecord::Migration[5.0]
  def change
    create_table :books do |t|
      t.string :title
      t.string :author
      t.string :genre
      t.string :classification
      t.string :type
      t.string :year
      t.timestamps
    end
  end
end
