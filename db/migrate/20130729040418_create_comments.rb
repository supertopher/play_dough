class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.belongs_to :user
      t.belongs_to :challenge
      t.integer :karma
      t.text :body

      t.timestamps
    end
    add_index :comments, :user_id
    add_index :comments, :challenge_id
  end
end
