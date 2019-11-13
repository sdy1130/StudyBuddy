class AddSignupFieldsToUsers < ActiveRecord::Migration[6.0]
  def change
    change_table :users do |t|
      remove_column :users, :name
      add_column :users, :first_name, :string
      add_column :users, :last_name, :string
      add_column :users, :user_name, :string
    end
  end
end
