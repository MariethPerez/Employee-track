class SessionsController < ApiController

  def new
  end

  def create
    user = User.find_by(email: params[:email].downcase)
    # Verify user exists in db and run has_secure_password's .authenticate()
    if user && user.authenticate(params[:password])
    # if user && user.authenticate(params[:password])
      # Save the user.id in that user's session cookie:
      session[:user_id] = user.id.to_s
      render json: user, status: :ok
    else
      message = { error: "Invalid email or password" }
      render json: message, status: :unauthorized
    end
  end

  def destroy
    session.delete(:user_id)
    head :no_content
  end
end
