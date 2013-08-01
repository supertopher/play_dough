class HomeController < ApplicationController
  skip_before_filter :require_login

  def index
    @days = [1,2,3,4,5,6,7]
    @events = Event.all
    @events_with_times = []
    @events.each do |event|
      event.event_times.each do |event_time|
        @events_with_times << [event, event_time]
      end
    end
    return unless current_user && current_user.cohort

    # loop through all of the user's events and fill two
    # arrays, one for the day and one for the week
    phase_time = current_user.cohort.current_phase_day
    phase_day = phase_time.last
    phase_week = phase_time.first
    @events_for_today = []
    @events_for_week = []
    current_user.cohort.phase.events.each do |event|
      event.event_times.each do |event_time|
        if event_time.week.to_i == phase_time.first
          @events_for_week << [event, event_time]

          if event_time.day.to_i == phase_time.last
            @events_for_today << [event, event_time]
          end
        end
      end
    end
    @challenges_for_today = current_user.cohort.phase.challenges.where(default_week: phase_week, default_day: phase_day)
    cores = @challenges_for_today.select {|c| c.required? }
    non_cores = @challenges_for_today - cores
    @challenges_for_today = cores + non_cores
  end

  def show
  end

  def new
  end

  def create
  end

end
