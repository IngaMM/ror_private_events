class CreateEventAttendances < ActiveRecord::Migration[5.2]
  def change
    create_table :event_attendances do |t|
      t.timestamps
    end
    add_column :event_attendances, :attended_event_id, :integer, index: true
    add_foreign_key :event_attendances, :events, column: :attended_event_id
    add_column :event_attendances, :attendee_id, :integer, index: true
    add_foreign_key :event_attendances, :users, column: :attendee_id
  end
end
