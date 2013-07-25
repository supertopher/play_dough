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

class EventTimes < ActiveRecord::Base
  # attr_accessible :title, :body
end
