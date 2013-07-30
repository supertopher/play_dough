# Read about factories at https://github.com/thoughtbot/factory_girl
require 'factory_girl'
require 'faker'

FactoryGirl.define do
  factory :comment, :class => 'Comments' do
    user      {rand(User.count)}
    challenge {Challenge.last}
    karma     {rand(10)}
    body      {Faker::Lorem.sentences(3)}
  end
end
