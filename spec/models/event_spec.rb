# == Schema Information
#
# Table name: events
#
#  id          :integer          not null, primary key
#  title       :string(255)
#  url         :string(255)
#  description :string(255)
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

require 'spec_helper'

describe Event do
  it { should have_many(:phase_events)}
  it { should have_many(:phases).through(:phase_events)}
  it { should have_many(:event_times)}
end
