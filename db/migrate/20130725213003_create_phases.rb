class CreatePhases < ActiveRecord::Migration
  def change
    create_table :phases do |t|
      t.integer :number
      t.string :location
      t.timestamps
    end
  end
end
