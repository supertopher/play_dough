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
    @all_events = Event.all
    @todays_events = []
  	@all_events.each do |event|
      if event.start === Date.today
        @todays_events << event
      end
    end
    @phases = Phase.all
    @active_phases = []
    @phases.each do |phase|
      if phase.start < Date.today
        @active_phases << phase
      end
    end
    @all_phases
    @todays_events
    @active_phases
  end

  def show
  end
  
  def new
  end

  def create
  end

end
