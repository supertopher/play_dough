class ChallengesController < ApplicationController

  def list

  end

  def show

  end

  def new
    @challenge = Challenge.new

  end

  def create
    @challenge = Challenge.create(params[:challenge])
    redirect_to root_path
  end

  def edit

  end

  def update

  end

  def delete

  end

end


