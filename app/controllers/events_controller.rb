class EventsController < ApplicationController
  
  def list

  end

  def show

  end

  def new
  	@event = Event.new
  	# time_event = @event.event_times.build
  	# time_event.build
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


