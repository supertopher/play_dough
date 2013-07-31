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

task set_days: :environment do
  # there are 9 weeks in dev_boot
  week_challenges = []
  challenge_count = 0
  (1..9).each do |this_week|
    week_challenges = Challenge.find_all_by_default_week(this_week)
    challenge_count += week_challenges.count
    week_challenges.each do |this_challenge|
      this_challenge.update_attribute(:default_day, (this_challenge.level+1))
    end
  end
  puts "Found and changed #{challenge_count} default_day now == level+1"
end

task set_phase: :environment do
  # 1..8 there are no week 9 tasks
  week_challenges = []
  challenge_count = 0
  week_counter = 0
  (1..8).each do |this_week|
    week_challenges = Challenge.find_all_by_default_week(this_week)
    challenge_count += week_challenges.count
    week_challenges.each do |this_challenge|
      week_counter = ((this_week-1)/3)+1
      this_challenge.update_attribute(:phase, Phase.find(week_counter))
    end
    puts "Found and changed #{challenge_count} phases in week #{this_week} set to phase #{week_counter}"
  end
end