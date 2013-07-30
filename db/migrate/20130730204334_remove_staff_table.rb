class RemoveStaffTable < ActiveRecord::Migration
  def change
    drop_table :staffs
  end
end
