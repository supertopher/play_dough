# == Schema Information
#
# Table name: comments
#
#  id           :integer          not null, primary key
#  user_id      :integer
#  challenge_id :integer
#  karma        :integer
#  body         :text
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :challenge
  attr_accessible :body, :karma, :user, :challenge
end
