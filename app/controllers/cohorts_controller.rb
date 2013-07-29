class CohortsController < ApplicationController
  def index
    @cohorts = Cohort.all
  end

  def new
    @cohort = Cohort.new
  end

  def create
    @cohort = Cohort.new(params[:cohort])
    if @cohort.save
      flash[:notice] = "Successfully created cohort!"
      redirect_to cohorts_path
    else
      flash[:error] = @cohort.errors.full_messages
      redirect_to cohort_new_path
    end
  end

  def show
    @cohort = Cohort.find(params[:id])
  end
end
