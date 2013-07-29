class AddNameFieldToPhases < ActiveRecord::Migration
  def change
    add_column :phases, :name, :string
  end
end
