# == Schema Information
#
# Table name: challenges
#
#  id                :integer          not null, primary key
#  actor_id          :integer
#  challenge_unit_id :integer
#  required          :boolean
#  level             :integer
#  name              :string(255)
#  description       :text
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#

require 'spec_helper'

describe Challenge do
  pending "add some examples to (or delete) #{__FILE__}"
end
