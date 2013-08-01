# == Schema Information
#
# Table name: challenge_attempts
#
#  id           :integer          not null, primary key
#  url          :string(255)
#  challenge_id :integer
#  user_id      :integer
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

class ChallengeAttempt < ActiveRecord::Base
  attr_accessible :url, :challenge, :user, :challenge_id, :user_id
  belongs_to :challenge
  belongs_to :user

end
