class CommentsController < ApplicationController
  def create
    @comment = Comment.new(params[:comment])
    @comment.user = current_user
    challenge_page = Challenge.find(params[:challenge_id])
    @comment.challenge = challenge_page
    @comment.save
    redirect_to challenge_path(@comment.challenge)
  end
end