<<<<<<< HEAD
require 'spec_helper'

describe EventTimes do
  pending "add some examples to (or delete) #{__FILE__}"
=======
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

describe EventTime do
  it { should belong_to(:event)}
>>>>>>> e14d6e602ed110f9e842c6fcbae2d2fae1bec5ea
end
