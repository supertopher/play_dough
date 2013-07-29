class CreateStaffs < ActiveRecord::Migration
  def change
    create_table :staffs do |t|
      t.string :name
      t.string :home_location
      t.references :phase
      t.timestamps
    end
  end
end
