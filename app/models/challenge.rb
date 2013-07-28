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
#  phase_id          :integer
#  default_week      :integer
#  default_day       :integer
#

class Challenge < ActiveRecord::Base
  attr_accessible :actor_id, :challenge_unit_id, :description, :level, :name, :required
end
