task :set_weeks => :environment do
  # 27 begins the base of current week challenges
  week_counter = 0
  (27..34).each do |this_challenge_unit_id|
    challenges = Challenge.find_all_by_challenge_unit_id(this_challenge_unit_id)
    week_counter += 1
    challenges.each do |this_challenge_unit|
      this_challenge_unit.update_attribute(:default_week, week_counter)
    end
    puts "Changed #{challenges.count} default weeks to #{week_counter} for challenge_unit_id #{this_challenge_unit_id}"
  end
end