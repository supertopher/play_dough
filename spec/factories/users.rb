require 'factory_girl'
require 'faker'

FactoryGirl.define do
  factory :user do
    email     {Faker::Internet.email}
    password  "password"
    cohort
  end
end