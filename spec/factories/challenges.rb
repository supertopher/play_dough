require 'factory_girl'
require 'faker'

FactoryGirl.define do
  factory :challenge do
    actor_id          {rand(10)}
    # challenge_unit_id 69
    required          true
    # level             18
    default_week        1
    default_day         1
    name              {Faker::Company.bs}
    description       {Faker::Lorem.paragraphs(3)}
  end
end

