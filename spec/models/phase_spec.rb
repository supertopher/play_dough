# == Schema Information
#
# Table name: phases
#
#  id         :integer          not null, primary key
#  number     :integer
#  location   :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'spec_helper'

describe Phase do
  it { should have_many(:phase_events)}
  it { should have_many(:events).through(:phase_events)}
  it { should have_many(:events).through(:phase_events)}
end
