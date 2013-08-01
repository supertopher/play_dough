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
    @all_events = Event.all
  end

  def create
    ap params
    @event = Event.create(params[:event])
    params[:phase_event].each do |phase, value|
      if value == '1'
        phase_event = PhaseEvent.create(phase_id: phase, event_id: @event.id)
      end
    end
    event_times = params[:event_time]
    start_time = Time.parse(event_times["start_time(4i)"] + ":" + event_times["start_time(5i)"])
    ap start_time
    end_time = Time.parse(event_times["end_time(4i)"] + ":" + event_times["end_time(5i)"])


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
    @event = Event.find(params[:id])
    @event.phase_events.build
    @event.event_times.build
    @event.phases.build
    @phases = Phase.all
    @phases.map! {|phase| ["phase #{phase.number} in #{phase.location}", phase.id] }
  end

  def update
    event = Event.find(params[:id])
    event.update_attributes(params[:event])
    ap params
  end

  def destroy
   event = Event.find(params[:id])
   event.destroy
    redirect_to new_event_path
  end

end
