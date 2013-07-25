class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :title, :url, :description
      t.timestamps
    end
  end
end
