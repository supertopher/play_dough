<<<<<<< HEAD
require 'spec_helper'

describe Event do
  pending "add some examples to (or delete) #{__FILE__}"
=======
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
>>>>>>> e14d6e602ed110f9e842c6fcbae2d2fae1bec5ea
end
