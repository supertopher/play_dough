class HomeController < ApplicationController
  def index
    phase_time = current_user.cohort.current_phase_day
    current_user_events = current_user.cohort.phase.events

    phase_number = current_user.cohort.phase.number
    if phase_number == 2
      phase_time[0] = phase_time.first - 3
    elsif phase_number == 3
      phase_time[0] = phase_time.first - 6
    end
    @events_for_today = []

    current_user_events.each do |event|
      event.event_times.each do |event_time|
        if event_time.week.to_i == phase_time.first && event_time.day.to_i == phase_time.last
          @events_for_today << [event, event_time]
        end
      end
    end
    #make these helper methods: todays_events, events_by_cohort, cohort_wide_events
  	# @all_phases = []
  	# phase_count = Phase.all.count
  	# all_events = Event.all
  	# all_events.each do |event|
  	# 	if event.phases.count == phase_count
  	# 		@all_phases << event
  	# 	end
  	# end
   #  @todays_events = []
  	# all_events.each do |event|
   #    if event.start === Date.today
   #      @todays_events << event
   #    end
   #  end
   #  @phases = Phase.all
   #  @active_phases = []
   #  @phases.each do |phase|
   #    if phase.start < Date.today
   #      @active_phases << phase
   #    end
   #  end
   #  @all_phases
   #  @todays_events
   #  @active_phases
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
