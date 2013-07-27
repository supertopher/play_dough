# require 'psych'

task :yaml => :environment do
  require 'yaml'
  class Challenge
    attr_accessor :attributes
  end

   # = YAML::load(File.open(Dir.pwd+'/challenges.yml','r'))
   challenge_list = YAML.load_file('challenges.yml')
   challenge_list.each do |this_challenge|
    attribute_hash = this_challenge.attributes
    Assignment.create(
        actor_id:           attribute_hash["actor_id"],
        challenge_unit_id:  attribute_hash["challenge_unit_id"],
        required:           attribute_hash["required"],
        level:              attribute_hash["level"],
        name:               attribute_hash["name"],
        description:        attribute_hash["description"],
        created_at:         attribute_hash["created_at"]
        )
  end


end

task :dev_seed do
  if File.exist?('challenges_2.psql')
    exec 'psql play_dough_development < challenges_2.psql'
    exec 'psql play_dough_test < challenges_2.psql'
  else
    raise "File challenges_2.psql missing from root.  Not on git, get a copy from Chris."
  end
end