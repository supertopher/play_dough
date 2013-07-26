class PhasesController < ApplicationController
  def index
    @phases = Phase.all
  end

  def new
    @phase = Phase.new
  end

  def create
    phase = Phase.new(params[:phase])
    if phase.save
      flash[:notice] = "You have created phase #{phase.number} at #{phase.location}."
      redirect phases_path
    else
      flash[:error] = "Something went wrong"
      redirect phases_path
    end
  end
end
