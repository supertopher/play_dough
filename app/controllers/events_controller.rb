class EventsController < ApplicationController
  
  def list

  end

  def show

  end

  def new
  	@event = Event.new
  	event_time = @event.event_times.build
    @event.phase_events.build
  end

  def create
  	@event = Event.create(params[:event])
  	redirect_to root_path
  end

  def edit

  end

  def update

  end

  def delete

  end

end


