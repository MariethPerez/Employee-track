
class UsersController < ApiController
  before_action :authorize_login, only: [:index,:show, :create, :new, :metrics_entry_exit]
  def new
    @user = User.new
  end

  def index
    @users = User.all
    authorize [@users]
    render json: @users
  end

  def show
    @user = User.find(params[:id])
    authorize [@user]
    render json: @user
  end

  def create
    @user = User.new(user_params)
    authorize [@user]
    @user.email.downcase!

    if @user.save
      # If user saves in the db successfully:
      render json: @user, status: :created
    else
      render json:  @user.errors, status: :bad_request
    end
  end

  #Reports
  def metrics_entry_exit
    # http://localhost:3000/api/metrics_entry_exit/2/?start_date=2019-10-01&end_date=2019-12-31
     @dialings = EmployeeQueries.new.entry_exit(params[:id],params[:start_date],params[:end_date])
     @user=User.find(params[:id])
     authorize [@user]
     render json: @dialings, status: :ok
  end

  rescue_from ActiveRecord::RecordNotFound do |e|
    render json: { message: e.message }, status: :not_found
  end

private

  def user_params
    params.permit(:name,:email, :role, :password, :password_confirmation)

  end

end
