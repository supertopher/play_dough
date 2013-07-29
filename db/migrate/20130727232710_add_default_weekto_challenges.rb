class AddDefaultWeektoChallenges < ActiveRecord::Migration
  def change
    add_column :challenges, :default_week, :integer
    add_column :challenges, :default_day, :integer
  end
end
