class AddWeekIdToChallenges < ActiveRecord::Migration
  def AddWeekIdToChallenges
    change_table :challenges do |t|
      t.integer :week, :day
    end
  end
end
