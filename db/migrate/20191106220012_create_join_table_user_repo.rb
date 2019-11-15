class CreateJoinTableUserRepo < ActiveRecord::Migration[6.0]
  def change
    create_join_table :Repos, :Users do |t|
      t.index [:repo_id, :user_id]
      t.index [:user_id, :repo_id]
    end
  end
end