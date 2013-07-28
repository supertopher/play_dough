class EventsController < ApplicationController

  def index
    @events = Event.all
  end

  def show

  end

  def new
  	@event = Event.new
    @event.phase_events.build
    @event.event_times.build
    @phases = Phase.all
    @phases.map! {|phase| ["phase #{phase.number} in #{phase.location}", phase.id] }
  end

  def create
    @event = Event.create(params[:event])
    params[:phase_event].each do |phase, value|
      if value == '1'
        phase_event = PhaseEvent.create(phase_id: phase, event_id: @event.id)
      end
    end

    event_times = params[:event_time]
    start_time = Time.parse("#{event_times[:start_hour]}:#{event_times[:start_minute]}")
    end_time = Time.parse("#{event_times[:end_hour]}:#{event_times[:end_minute]}")
    debugger

    params[:week].each do |week_and_day, status|
      if status == '1'
        EventTime.create(event_id: @event.id,
                          start_time: start_time,
                          end_time: end_time,
                          week: week_and_day.first, day: week_and_day.last)
      end
    end

  redirect_to root_path
end

def edit

end

def update

end

def delete

end

end

# every event_time (ex: week1 monday, is its own object and referecnes to event id)

# Table name: event_times
#
#  id         :integer          not null, primary key
#  event_id   :integer
#  week       :integer
#  day        :integer
#  start_time :time
#  end_time   :time
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

 # "week_1" => {
 #        "1" => "1",
 #        "2" => "0",
 #        "3" => "1",
 #        "4" => "0",
 #        "5" => "0",
 #        "6" => "0",
 #        "7" => "0"
 #    },
 #       "week_2" => {
 #        "1" => "1",
 #        "2" => "1",
 #        "3" => "0",
 #        "4" => "0",
 #        "5" => "0",
 #        "6" => "0",
 #        "7" => "0"
 #    },
 #                "week_3" => {
 #        "1" => "0",
 #        "2" => "1",
 #        "3" => "0",
 #        "4" => "0",
 #        "5" => "0",
 #        "6" => "0",
 #        "7" => "0"
 #    },

