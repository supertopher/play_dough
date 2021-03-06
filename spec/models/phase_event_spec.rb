# == Schema Information
#
# Table name: phase_events
#
#  id         :integer          not null, primary key
#  phase_id   :integer
#  event_id   :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'spec_helper'

describe PhaseEvent do
  it { should belong_to(:phase)}
  it { should belong_to(:event)}
end
