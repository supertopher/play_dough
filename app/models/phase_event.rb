class PhaseEvent < ActiveRecord::Base
  # attr_accessible :title, :body
  belongs_to :event, :phase
end
