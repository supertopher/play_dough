# == Schema Information
#
# Table name: event_times
#
#  id         :integer          not null, primary key
#  event_id   :integer
#  week       :integer
#  day        :integer
#  start_time :time
#  end_time   :time
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class EventTime < ActiveRecord::Base
  attr_accessible :week , :day, :start_time, :end_time, :event_id
  belongs_to :event
end
