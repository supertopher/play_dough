desc 'Seedz'

task seed_comments: :environment do

  COMMENTS = [
    "I found this like useful.  For realz\r\n\r\n<http://devbootcamp.com/> Learn to be a Rails Developer in 9 Intense weeks",
    "### Numbers to words recursion\r\n``` ruby\r\n  return \"\" if number_input == 0\r\n    numbers.each do |increment, word|\r\n      if increment > number_input\r\n        return word + in_words_reursion(number_input-increment) unless number_input == 0\r\n      end\r\n    end\r\n  # return output\r\nend\r\n\r\n```",
    "### Comment Error Handling\r\n``` javascript\r\n$(function(){\r\n  $('.comment_submit').click(function(event){\r\n    if ($('#comment_body').val() === \"\")\r\n    {\r\n      event.preventDefault();\r\n      $(\".new_comment_form\").append(\"<h3 class='error'>Please enter a comment.</h3>\")\r\n    }\r\n  })\r\n});\r\n```\r\n### Thanks Zee!\r\n![Sexy Zee](https://www.filepicker.io/api/file/jeNGVzQo6QIg0BKTnHpA/convert?w=300&h=300)\r\n\r\n",
    "```ruby\r\n  def change\r\n    change_column :comments, :karma, :integer, :default => 0\r\n  end\r\n#i have karam\r\n```"
  ]
  fence_lizards  = Cohort.find_by_name("Fence Lizards")
  island_foxes   = Cohort.find_by_name("Island Foxes")
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
