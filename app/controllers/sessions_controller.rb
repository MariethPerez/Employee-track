class SessionsController < ApiController

  def new
    # No need for anything in here, we are just going to render our
    # new.html.erb AKA the login page
  end

  def create
    # Look up User in db by the email address submitted to the login form and
    # convert to lowercase to match email in db in case they had caps lock on:
    puts 'create mar'
     puts params
    # user = User.find_by(email: params[:login][:email].downcase)
    user = User.find_by(email: params[:email].downcase)
    puts 'use mar'
    puts user
    # Verify user exists in db and run has_secure_password's .authenticate()
    # method to see if the password submitted on the login form was correct:
    if user && user.authenticate(params[:password])
    # if user && user.authenticate(params[:login][:password])
      # Save the user.id in that user's session cookie:
      session[:user_id] = user.id.to_s
      puts 'session mar'
      puts session[:user_id]
      # redirect_to root_path, notice: 'Successfully logged in!'
      render json: user, status: :ok
    else
      # if email or password incorrect, re-render login page:
      # flash.now.alert = "Incorrect email or password, try again."
      # render :new
      message = { error: "Invalid email or password" }
      render json: message, status: :unauthorized
    end
  end

  def destroy
    # delete the saved user_id key/value from the cookie:
    puts 'destroy'
    puts session
    session.delete(:user_id)
    head :no_content
    # redirect_to login_path, notice: "Logged out!"
  end
end
