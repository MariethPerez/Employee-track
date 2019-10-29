class ApplicationController < ActionController::Base
  include Pundit
  protect_from_forgery with: :exception
  helper_method :current_user

  # current_user method:
  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def authorize_login
    redirect_to login_path, alert: 'You must be logged in to access this page.' if current_user.nil?
  end
end
