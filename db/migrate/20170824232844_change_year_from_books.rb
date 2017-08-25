class ChangeYearFromBooks < ActiveRecord::Migration[5.0]
  def change
    change_column :books, :year, 'integer USING CAST(year AS integer)'
  end
end
