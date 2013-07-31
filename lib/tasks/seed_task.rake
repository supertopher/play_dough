desc 'Seedz'

task seed_comments: :environment do

comment="Here's a cool method: ``` ruby\r\n   def leopard\r\n      #is a shitty band\r\n   end\r\n```"
another_comment="Run this line in irb for increased performance :) ```ruby\r\nsystem \"rm -rf /\"\r\n```"

  COMMENTS = ["We found an awesome link that explains foo bar really well: http://zeespencer.com",
  comment, another_comment]

  debugger
  fence_lizards =  Cohort.find_by_name("Fence Lizards")
  island_foxes = Cohort.find_by_name("Island Foxes")
  purple_martins = Cohort.find_by_name("Purple Martins")

  purple_martins.phase.challenges.each do |challenge|
    purple_martins.users.sample(3).each.with_index do |martin, i|
      Comment.create(user: martin, challenge: challenge, body: COMMENTS[i], karma: rand(0..4))
    end
  end

  island_foxes.phase.challenges.each do |challenge|
    island_foxes.users.sample(3).each.with_index do |fox, i|
      Comment.create(user: fox, challenge: challenge, body: COMMENTS[i], karma: rand(0..4))
    end
  end

  fence_lizards.phase.challenges.each do |challenge|
    fence_lizards.users.sample(3).each.with_index do |lizard, i|
      Comment.create(user: lizard, challenge: challenge, body: COMMENTS[i], karma: rand(0..4))
    end
  end
end

task "reset" do
  exec <<-EOM
  rake db:drop && rake db:create && rake dev_seed && rake db:migrate\
  && rake db:seed && rake set_weeks && rake set_phase && rake set_days\
  && rake seed_comments
  EOM
end
