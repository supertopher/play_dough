<<<<<<< HEAD
require 'spec_helper'

describe Phase do
  pending "add some examples to (or delete) #{__FILE__}"
=======
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
>>>>>>> e14d6e602ed110f9e842c6fcbae2d2fae1bec5ea
end
