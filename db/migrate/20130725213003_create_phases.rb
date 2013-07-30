class CreatePhases < ActiveRecord::Migration
  def change
    create_table :phases do |t|
      t.integer :number
      t.string :location
      t.date :start
      t.timestamps
    end
  end
end
