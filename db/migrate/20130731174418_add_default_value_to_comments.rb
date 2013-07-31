class AddDefaultValueToComments < ActiveRecord::Migration
  def change
    change_column :comments, :karma, :integer, :default => 0
  end
end
