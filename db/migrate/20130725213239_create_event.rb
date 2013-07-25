class CreateEvent < ActiveRecord::Migration
  def change
    create_table :event do |t|
      t.string :title, :url, :description
      t.timestamps
    end
  end
end
