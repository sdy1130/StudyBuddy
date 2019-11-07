class AddRelations < ActiveRecord::Migration[6.0]
  def change
    add_reference :comments, :user, index: true
    add_reference :comments, :post, index: true
    add_reference :posts, :user, index: true
    add_reference :posts, :course, index: true
  end
end