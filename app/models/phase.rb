
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
>>>>>>> e14d6e602ed110f9e842c6fcbae2d2fae1bec5ea
  has_many :events, :through => :phase_events
end
