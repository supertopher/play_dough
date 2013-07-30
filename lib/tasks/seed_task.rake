desc 'Stop Drop and Load'
task "reset" do
  exec "rake db:drop && rake db:create && rake dev_seed && rake db:migrate && rake db:seed"
end
