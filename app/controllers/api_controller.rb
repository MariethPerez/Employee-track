class ApiController < ActionController::API
        # authroize method redirects user to login page if not logged in:
  helper_method :current_user

  # Define the current_user method:
  def current_user
    # Look up the current user based on user_id in the session cookie:
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

    def authorize
      render_unauthorized('Access denied') if current_user.nil?
      # redirect_to login_path, alert: 'You must be logged in to access this page.' if current_user.nil?
    end

  private

  def render_unauthorized(message)
    errors = { errors: { message: message } }
    render json: errors, status: :unauthorized
  end
end
