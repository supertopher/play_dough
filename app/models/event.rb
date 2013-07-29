
# == Schema Information
#
# Table name: events
#
#  id          :integer          not null, primary key
#  title       :string(255)
#  url         :string(255)
#  description :string(255)
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Event < ActiveRecord::Base
  attr_accessible :title, :description, :url, :phase_events_attributes, :phases_attributes, :event_times_attributes
  # accepts_nested_attributes_for :event_times
  has_many :phase_events  
  has_many :phases, :through => :phase_events
  has_many :event_times
  accepts_nested_attributes_for :phase_events, :phases, :event_times

end
