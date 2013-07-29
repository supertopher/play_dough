class CreateChallenges < ActiveRecord::Migration
  def change
    create_table :assignments do |t|
      t.integer :actor_id
      t.integer :challenge_unit_id
      t.boolean :required
      t.integer :level
      t.string :name
      t.text :description

      t.timestamps
    end
  end
end
