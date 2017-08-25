class RemoveTypeFromBooks < ActiveRecord::Migration[5.0]
  def change
    remove_column :books, :type, :string
  end
end
