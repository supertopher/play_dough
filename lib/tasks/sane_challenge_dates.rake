task :set_weeks => :environment do
  challenges = Challenge.find_by_challenge_unit_id(27)
  challenges.update_attribute(:default_week)
  puts "Changed default week to 1 for C_U_id 27"
end