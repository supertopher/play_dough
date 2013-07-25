class CreatePhaseEvents < ActiveRecord::Migration
  def change
    create_table :phase_events do |t|
      t.belongs_to :phase
      t.belongs_to :event
      t.timestamps
    end
  end
end
