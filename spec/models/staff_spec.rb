# == Schema Information
#
# Table name: staffs
#
#  id            :integer          not null, primary key
#  name          :string(255)
#  home_location :string(255)
#  phase_id      :integer
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

require 'spec_helper'

describe Staff do
  pending "add some examples to (or delete) #{__FILE__}"
end
