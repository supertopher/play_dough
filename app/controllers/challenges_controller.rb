class ChallengesController < ApplicationController

  def index
    @challenge_list = Challenge.limit(20).order('id desc')
    # Changes for understanding legacy logic, not permanent
    # @challenge_list = Challenge.find_all_by_default_week(1)
    @markdown = Redcarpet::Markdown.new(Redcarpet::Render::HTML,
      :autolink => true, :space_after_headers => true,
      :fenced_code_blocks => true)
  end

  def show
    @challenge = Challenge.find(params[:id])
    # markdown to HTML
    # @markdown = Redcarpet::Markdown.new(Redcarpet::Render::HTML,
    #   :autolink => true, :space_after_headers => true,
    #   :fenced_code_blocks => true, :highlight => true)
    @comment = Comment.new
    @comment.challenge = @challenge
    @comment.user = current_user
  end

  def new
    redirect_to challenges_path unless current_user.staff
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


