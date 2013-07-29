class HomeController < ApplicationController
  def index
  	@all_phases = []
  	phase_count = Phase.all.count
  	all_events = Event.all
  	all_events.each do |event|
  		if event.phases.count == phase_count
  			@all_phases << event
  		end
  	end
  	@all_phases
    @phases = Phase.all
  end

  # if current_user.cohort.current_phase_day.nil? && current_user.cohort.start_date < DateTime.now
  # current_user.cohort.current_phase_day = DateTime.now - current_user.cohort.start_date


  def show
  end

  def new
  end

  def create
  end

end
