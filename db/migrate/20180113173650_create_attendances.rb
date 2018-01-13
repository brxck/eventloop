class CreateAttendances < ActiveRecord::Migration[5.1]
  def change
    create_table :attendances do |t|
      t.references :attended_event, foreign_key: true
      t.references :attendee, foreign_key: true

      t.timestamps
    end
  end
end
