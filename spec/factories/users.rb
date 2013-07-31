require 'factory_girl'
require 'faker'

FactoryGirl.define do
	factory :user do
		email     {Faker::Internet.email}
		password  "password"
		cohort
	end


	factory :admin, class: User do
		email     {Faker::Internet.email}
		password  "password"
		staff 	  true
	end
end
