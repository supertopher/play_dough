class ChallengesController < ApplicationController

  def index
    @challenge_list = Challenge.limit(20).order('id desc')
  end

  def show
    @challenge = Challenge.find(params[:id])
  end

  def new
    @challenge = Challenge.new
  end

  def create
    pp params
    @challenge = Challenge.create(params[:challenge])
    redirect_to root_path
  end

  def edit
    @challenge = Challenge.find(params[:id])
  end

  def update
    pp params
    @challenge = Challenge.find(params[:id])
    @challenge.update_attributes(params[:challenge])
    redirect_to challenge_path(params[:id])
  end

  def delete

  end

end


