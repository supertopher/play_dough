class Event < ActiveRecord::Base
  # attr_accessible :title, :body
  has_many :phases, :through => :phase_events

end
