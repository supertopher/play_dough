class EventsController < ApplicationController
  
  def list

  end

  def show

  end

  def new
  	@event = Event.new
    @event.phase_events.build
    @event.event_times.build
  	# event_time = @event.event_times.build
    # @event.phase_events.build
    @phases = Phase.all
    @phases.map! {|phase| ["phase #{phase.number} in #{phase.location}", phase.id] }
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
    start_time = Time.parse("#{event_times[:start_hour]}:#{event_times[:start_minute]}")
    end_time = Time.parse("#{event_times[:end_hour]}:#{event_times[:end_minute]}")
    
    week = params[:event_day]

    event_day = params[:event_day]
    EventTime.create(start_time: start_time, end_time: end_time, week: week, day: event_day )
  	redirect_to root_path
  end

  def edit

  end

  def update

  end

  def delete

  end

end


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
