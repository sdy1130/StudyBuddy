class CreateOfferings < ActiveRecord::Migration[6.0]
  def change
    create_table :offerings do |t|
      t.string :course_id

      t.string :description

      t.float :cost, default: 0

      t.timestamp :startTime
      t.timestamp :endTime

      t.string :address, null: true
      t.decimal :latitude, null: true
      t.decimal :longitude, null: true

      t.string :status, :default => 'Free'

      t.references :organizer, foreign_key: { to_table: 'users' }
      t.references :attendee, foreign_key: { to_table: 'users' }

      t.timestamps
    end
  end
end
