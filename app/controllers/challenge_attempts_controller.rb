class ChallengeAttemptsController < ApplicationController
  def create
    attempt = ChallengeAttempt.new(url: params[:url], challenge_id: params[:challenge_id])
    attempt.user = current_user
    if attempt.save
      redirect_to challenges_path
    else
      @errors = attempt.errors.full_messages
      redirect_to request.referrer
    end
  end
end
