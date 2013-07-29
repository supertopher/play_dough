class CreateCohortEvents < ActiveRecord::Migration
  def change
    create_table :cohort_events do |t|
      t.belongs_to :cohort
      t.belongs_to :event
    end
  end
end
