class CreateChallengeAttempts < ActiveRecord::Migration
  def change
    create_table :challenge_attempts do |t|
      t.string :url
      t.belongs_to :challenge
      t.belongs_to :user
      t.timestamps
    end
  end
end
