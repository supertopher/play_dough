# == Schema Information
#
# Table name: phase_events
#
#  id         :integer          not null, primary key
#  phase_id   :integer
#  event_id   :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class PhaseEvent < ActiveRecord::Base
  # attr_accessible :title, :body
  belongs_to :event 
  belongs_to :phase
end
