class CreateReposCoursesJoinTable < ActiveRecord::Migration[6.0]
  def change
    create_join_table :repos, :courses do |t|
      t.index :repo_id
      t.index :course_id
    end
  end
end
