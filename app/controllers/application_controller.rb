class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :logged_in?
  helper_method :current_user
  helper_method :current_user_actor?


  # Returns the current logged-in user (if any).
  def current_user
    @current_user ||= User.find_by(id: session[:id])
  end

  # Returns true if the user is logged in, false otherwise.
  def logged_in?
    !current_user.nil?
  end

  def current_user_actor?
    User.find(session[:id]).is_studio == 0
  end

end
