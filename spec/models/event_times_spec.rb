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

require 'spec_helper'

describe EventTimes do
  pending "add some examples to (or delete) #{__FILE__}"
end
