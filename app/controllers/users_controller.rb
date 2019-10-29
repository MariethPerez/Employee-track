
class UsersController < ApiController
  #Uncoment TO-DO authorize_login AND authorize
  # before_action :authorize_login, only: [:index,:show, :create, :new]
  def new
    @user = User.new
  end

  def index
    @users = User.all
    # authorize [@users]
    render json: @users
  end

  def show
    @user = User.find(params[:id])
    # authorize [@user]
    render json: @user
  end

  def create
    @user = User.new(user_params)
    # authorize [@user]
    # store all emails in lowercase to avoid duplicates and case-sensitive login errors:
    @user.email.downcase!

    if @user.save
      # If user saves in the db successfully:
      render json: @user, status: :created
      # flash[:notice] = "Account created successfully!"
      # redirect_to root_path
    else
      # If user fails model validation - probably a bad password or duplicate email:
      # flash.now.alert = "Oops, couldn't create account. Please make sure you are using a valid email and password and try again."
      # render :new

      render json:  @user.errors, status: :bad_request
    end
  end

  def metrics_entry_exit
    # http://localhost:3000/api/metrics_entry_exit/2/?start_date=2019-10-01&end_date=2019-12-31
     @dialings = EmployeeQueries.new.entry_exit(params[:id],params[:start_date],params[:end_date])
     @user=User.find(params[:id])
    #  authorize [@user]
     render json: @dialings, status: :ok
  end

private

  def user_params
    params.permit(:name,:email, :role, :password, :password_confirmation)

  end

end
