class RemoveEmailSaltEncryptedPasswordFromUsers < ActiveRecord::Migration[6.0]
  def change
    change_table :users do |t|
      remove_column :users, :email
      remove_column :users, :salt
      remove_column :users, :encrypted_password
    end
  end
end
