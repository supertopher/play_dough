class PhasesController < ApplicationController
  def index
    @phases = Phase.all
    @active_phase
  end

  def new
    @phase = Phase.new
  end

  def create
    phase = Phase.new(params[:phase])
    if phase.save
      flash[:notice] = "You have created phase #{phase.number} at #{phase.location}."
      redirect_to root_path
    else
      flash[:error] = "Something went wrong"
      redirect_to new_phase_path
    end
  end

  def show
    @phase = Phase.find(params[:id])

    #call method that evaluates if phase has started
  end

  def phase_active(phase)
    if phase.start < Date.today
      return true
    else
      return false
    end
  end
end
