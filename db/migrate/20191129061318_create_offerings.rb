class CreateOfferings < ActiveRecord::Migration[6.0]
  def change
    create_table :offerings do |t|
      t.string :course_id

      t.float :cost, default: 0

      t.timestamp :startTime
      t.timestamp :endTime

      t.string :street
      t.string :city
      t.string :province
      t.string :country
      t.string :address
      t.decimal :latitude
      t.decimal :longitude

      t.string :status, :default => 'Free'

      t.references :organizer, foreign_key: { to_table: 'users' }
      t.references :attendee, foreign_key: { to_table: 'users' }

      t.timestamps
    end
  end
end
