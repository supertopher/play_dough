# == Schema Information
#
# Table name: cohort_events
#
#  id        :integer          not null, primary key
#  cohort_id :integer
#  event_id  :integer
#

class CohortEvent < ActiveRecord::Base
  attr_accessible :cohort_id, :event_id
  belongs_to :cohort
  belongs_to :event
end
