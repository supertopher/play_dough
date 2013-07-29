class CreateCohorts < ActiveRecord::Migration
  def change
    create_table :cohorts do |t|
      t.string :name
      t.string :year
      t.string :start_date
      t.belongs_to :phase
    end
  end
end
