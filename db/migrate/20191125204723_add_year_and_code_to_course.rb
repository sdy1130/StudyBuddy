class AddYearAndCodeToCourse < ActiveRecord::Migration[6.0]
  def change
    add_column :courses, :year, :integer
    add_column :courses, :code, :string
  end
end
