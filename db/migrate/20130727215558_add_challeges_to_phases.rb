class AddChallegesToPhases < ActiveRecord::Migration
  def change
    change_table :challenges do |t|
      t.references :phase
    end

    change_table :phases do |t|
      t.references :challenge
    end
  end
end
