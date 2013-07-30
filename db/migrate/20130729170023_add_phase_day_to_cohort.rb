class AddPhaseDayToCohort < ActiveRecord::Migration
  def change
    add_column :cohorts, :current_phase_day, :string
  end
end
