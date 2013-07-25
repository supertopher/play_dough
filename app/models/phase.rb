class Phase < ActiveRecord::Base
  # attr_accessible :title, :body
  has_many :events, :through => :phase_events
end
