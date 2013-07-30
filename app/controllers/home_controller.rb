class HomeController < ApplicationController
  skip_before_filter :require_login

  def index
    if current_user && current_user.cohort
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
      @events_for_week = []
      current_user_events.each do |event|
        event.event_times.each do |event_time|
          if event_time.week.to_i == phase_time.first
            @events_for_week << [event, event_time]
          end
        end
      end
    end
    @days = [1,2,3,4,5,6,7]
  end

  def show
  end

  def new
  end

  def create
  end

end
