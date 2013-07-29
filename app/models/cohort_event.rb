class CohortEvent < ActiveRecord::Base
  attr_accessible :cohort_id, :event_id
  belongs_to :cohort
  belongs_to :event
end
