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
#  name         :string(255)
#

class Phase < ActiveRecord::Base
  # attr_accessible :title, :body
  has_many :phase_events
  has_many :challenges
  has_many :events, :through => :phase_events
  attr_accessible :number, :location, :start
  accepts_nested_attributes_for :events




  after_create :set_name
  has_many :cohorts

  def set_name
    self.name = "Phase #{self.number} in #{self.location}"
    self.save
  end

end
