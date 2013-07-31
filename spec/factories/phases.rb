# == Schema Information
#
# Table name: phases
#
#  id           :integer          not null, primary key
#  number       :integer
#  location     :string(255)
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  challenge_id :integer
#  name         :string(255)

require 'factory_girl'
require 'faker'

FactoryGirl.define do
  factory :phase do
    name        "Test Lizard"
    number      1
    location    "San Francisco"
  end
end
