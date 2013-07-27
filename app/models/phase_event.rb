
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
  attr_accessible :phase_id, :event_id, :phase_attributes, :phase
  belongs_to :event 
  belongs_to :phase
  accepts_nested_attributes_for :phase
end
