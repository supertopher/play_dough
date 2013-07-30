# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


require 'faker'
phase_1 = Phase.create(number: 1, location: "San Francisco")
phase_2 = Phase.create(number: 2, location: "San Francisco")
phase_3 = Phase.create(number: 3, location: "San Francisco")
phase_4 = Phase.create(number: 4, location: "San Francisco")

fiery_skippers = Cohort.create(name: "Fiery Skippers", year: '2013', start_date: 'May 13, 2013', phase: phase_4)
fence_lizards = Cohort.create(name: "Fence Lizards", year: '2013', start_date: 'June 3, 2013', phase: phase_3)
island_foxes = Cohort.create(name: "Island Foxes", year: '2013', start_date: 'June 24, 2013', phase: phase_2)
purple_martins = Cohort.create(name: "Purple Martins", year: '2013', start_date: 'July 15, 2013', phase: phase_1)


20.times do |i|
  User.create(email: "skipper_#{i}@example.com",
              password: "password",
              cohort: fiery_skippers)
end

20.times do |i|
  User.create(email: "lizard_#{i}@example.com",
              password: "password",
              cohort: fence_lizards)
end

20.times do |i|
  User.create(email: "fox_#{i}@example.com",
              password: "password",
              cohort: island_foxes)
end

20.times do |i|
  User.create(email: "martin_#{i}@example.com",
              password: "password",
              cohort: purple_martins)
end

yoga = Event.create(title: "Yoga", description: "Yoga With KT")
mentor_night = Event.create(title: "Mentor Night", description: "Meet your mentors! Pizza n' beer.")
engineering_empathy = Event.create(title: "Engineering Empathy", description: "learn about peanut butter")
graduation = Event.create(title: "Phase 3 Graduates!!!", description: "Get cool dog tags n' shit.")
friday_check_in = Event.create(title: "Friday Check-ins", description: "Talk about your feelings in a circle of friends.")


yoga.event_times.push(EventTime.create(week: "1", day: "2", start_time: "12:30 pm", end_time: "1:30 pm" ),
                      EventTime.create(week: "1", day: "4", start_time: "12:30 pm", end_time: "1:30 pm" ),
                      EventTime.create(week: "2", day: "2", start_time: "12:30 pm", end_time: "1:30 pm" ),
                      EventTime.create(week: "2", day: "4", start_time: "12:30 pm", end_time: "1:30 pm" ),
                      EventTime.create(week: "3", day: "2", start_time: "12:30 pm", end_time: "1:30 pm" ),
                      EventTime.create(week: "3", day: "4", start_time: "12:30 pm", end_time: "1:30 pm" ))

mentor_night.event_times.push EventTime.create(week: "1", day: "2", start_time: "6:00 pm", end_time: "9:00 pm")

engineering_empathy.event_times.push(EventTime.create(week: "1", day: "4", start_time: "2:30 pm", end_time: "5:30 pm" ),
                                     EventTime.create(week: "2", day: "4", start_time: "2:30 pm", end_time: "5:30 pm" ))

graduation.event_times.push(EventTime.create(week: "3", day: "5", start_time: "5:00 pm", end_time: "5:30 pm"))

friday_check_in.event_times.push(EventTime.create(week: "1", day: "5", start_time: "9:00 am", end_time: "9:30 am"),
                                 EventTime.create(week: "2", day: "5", start_time: "9:00 am", end_time: "9:30 am"),
                                 EventTime.create(week: "3", day: "5", start_time: "9:00 am", end_time: "9:30 am"))

phase_1.events.push(yoga, mentor_night, engineering_empathy, graduation, friday_check_in)
phase_2.events.push(engineering_empathy, graduation, friday_check_in)
phase_3.events.push(engineering_empathy, graduation, friday_check_in)
phase_4.events.push(engineering_empathy, graduation, friday_check_in)
