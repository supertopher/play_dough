class CreateEventTimes < ActiveRecord::Migration
  def change
    create_table :event_times do |t|
      t.belongs_to  :event
      t.text     :week, :day
      t.time        :start_time
      t.time        :end_time
      t.timestamps
    end
  end
end
