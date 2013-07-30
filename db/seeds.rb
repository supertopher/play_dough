# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


require 'faker'
Phase.create(id: 1, number: 1, location: "San Francisco")
Phase.create(id: 2, number: 2, location: "San Francisco")
Phase.create(id: 3, number: 3, location: "San Francisco")



#users for cohort Lizard, phase 1, Event = Yoga Tues and Thursday
30.times do |user|
	user_args = {}

	user_args[:email] = Faker::Internet.email
	user_args[:password] = Faker::Lorem.word
      user_args[:cohort_id] = 1
	user = User.create(user_args)
      user.cohort = Cohort.create(id: 1, name: "Lizard", year: "2013", start_date: "2013-07-29", phase_id: 1)
      user.cohort.phase.events << Event.create(id: 1, title: "Yoga", description: "Yoga With KT")
      
      user.cohort.phase.events.each do |event|
          event.event_times << EventTime.create(id: 1, event_id: 1, week: "1", day: "2", start_time: "2000-01-01 19:00:00", end_time: "2000-01-01 08:00:00" ) 
          event.event_times << EventTime.create(id: 1, event_id: 1, week: "1", day: "4", start_time: "2000-01-01 19:00:00", end_time: "2000-01-01 08:00:00" ) 
          event.event_times << EventTime.create(id: 1, event_id: 1, week: "2", day: "9", start_time: "2000-01-01 19:00:00", end_time: "2000-01-01 08:00:00" ) 
          event.event_times << EventTime.create(id: 1, event_id: 1, week: "2", day: "11", start_time: "2000-01-01 19:00:00", end_time: "2000-01-01 08:00:00" ) 
          event.event_times << EventTime.create(id: 1, event_id: 1, week: "3", day: "16", start_time: "2000-01-01 19:00:00", end_time: "2000-01-01 08:00:00" ) 
          event.event_times << EventTime.create(id: 1, event_id: 1, week: "3", day: "18", start_time: "2000-01-01 19:00:00", end_time: "2000-01-01 08:00:00" )        
  end
end

#users for cohort Admirals, phase 2, Event = Yoga Tues and Thursday

