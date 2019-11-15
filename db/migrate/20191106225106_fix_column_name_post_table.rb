class FixColumnNamePostTable < ActiveRecord::Migration[6.0]
  def change
    rename_column :posts, :categories, :category
  end
end
