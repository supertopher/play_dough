# == Schema Information
#
# Table name: phases
#
#  id           :integer          not null, primary key
#  number       :integer
#  location     :string(255)
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  challenge_id :integer
#

class Phase < ActiveRecord::Base
  # attr_accessible :title, :body
  has_many :phase_events
  has_many :challenges
  has_many :events, :through => :phase_events
  attr_accessible :number, :location
  accepts_nested_attributes_for :events
end
