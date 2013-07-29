require 'factory_girl'
require 'faker'

FactoryGirl.define do
  factory :user do
    email     {Faker::Internet.email}
    password  "password"
    cohort_id 1
  end
end