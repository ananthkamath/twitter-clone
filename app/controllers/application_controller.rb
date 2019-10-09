class ApplicationController < ActionController::Base
  def set_current_profile
    @current_user_profile = current_user.profile
  end
end
