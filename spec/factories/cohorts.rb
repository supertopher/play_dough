#  name       :string(255)
#  year       :string(255)
#  start_date :string(255)
#  phase_id   :integer

require 'factory_girl'
require 'faker'

FactoryGirl.define do
  factory :cohort do
    name         {Faker::Name.name}
    year         {Time.now.year}
    start_date   {Time.now.to_date}
    phase
  end
end

