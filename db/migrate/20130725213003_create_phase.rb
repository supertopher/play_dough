class CreatePhase < ActiveRecord::Migration
  def change
    create_table :phase do |t|
      t.integer :phase
      t.string :location
      t.timestamps
    end
  end
end
