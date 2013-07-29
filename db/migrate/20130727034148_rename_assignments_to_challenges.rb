class RenameAssignmentsToChallenges < ActiveRecord::Migration
  def change
    rename_table(:assignments, :challenges)
  end
end
