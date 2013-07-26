# == Schema Information
#
# Table name: phases
#
#  id         :integer          not null, primary key
#  number     :integer
#  location   :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Phase < ActiveRecord::Base
  # attr_accessible :title, :body
  has_many :phase_events
  has_many :events, :through => :phase_events
end
