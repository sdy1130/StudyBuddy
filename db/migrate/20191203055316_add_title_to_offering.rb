class AddTitleToOffering < ActiveRecord::Migration[6.0]
  def change
    add_column :offerings, :title, :string
  end
end
