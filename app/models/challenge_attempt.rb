class ChallengeAttempt < ActiveRecord::Base
  attr_accessible :url, :challenge, :user, :challenge_id, :user_id
  belongs_to :challenge
  belongs_to :user
end
