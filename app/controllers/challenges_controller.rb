class ChallengesController < ApplicationController

  def index
    @challenge_list = Challenge.limit(20).order('id desc')
    @markdown = Redcarpet::Markdown.new(Redcarpet::Render::HTML,
      :autolink => true, :space_after_headers => true,
      :fenced_code_blocks => true)
  end

  def show
    @challenge = Challenge.find(params[:id])
    # markdown to HTML
    @markdown = Redcarpet::Markdown.new(Redcarpet::Render::HTML,
      :autolink => true, :space_after_headers => true,
      :fenced_code_blocks => true)
  end

  def new
    @challenge = Challenge.new
  end

  def create
    @challenge = Challenge.create(params[:challenge])
    redirect_to challenge_path(@challenge)
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

  def destroy
    @challenge = Challenge.find(params[:id])
    @challenge.destroy
    redirect_to challenges_path
  end

end


