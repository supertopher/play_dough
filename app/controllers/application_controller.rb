class ApplicationController < ActionController::Base
  protect_from_forgery

  before_filter :require_login

private

  def require_login
    unless current_user
      redirect_to root_path
    end
  end
end
