desc 'Stop Drop and Load'
task "reset" do
  exec <<-EOM
  rake db:drop && rake db:create && rake dev_seed && rake db:migrate\
  && rake db:seed && rake set_weeks && rake set_phase && rake set_days
  EOM
end
