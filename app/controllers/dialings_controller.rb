class DialingsController < ApiController
  #Uncoment TO-DO authorize_login AND authorize
  before_action :authorize_login, only: [:index,:show, :create, :update, :metrics_late_employees, :metrics_overtime_employees ]

  def index
    @dialings = Dialing.all
    authorize [@dialings]
    render json: @dialings
  end

  def show
    @dialing = Dialing.find(params[:id])
    authorize [@dialing]
    render json: @dialing

  end

  def create
    @dialing = Dialing.new(dialing_params)
    authorize [@dialing]
    if @dialing.save
      render json: @dialing, status: :created
    else
      render json:  @dialing.errors, status: :bad_request
    end
  end

  def update
    @dialing = Dialing.find(params[:id])
    authorize [@dialing]
    if @dialing.update(dialing_params)
      render json: @dialing, status: :ok
    else
      render json:  @dialing.errors, status: :bad_request
    end
  end

  #reports
  def metrics_late_employees
    # http://localhost:3000/api/metrics_late_employees/?start_date=2019-10-01&end_date=2019-10-31
     @dialings = EmployeeQueries.new.late_employees(params[:start_date],params[:end_date])
     authorize [@dialings]
     render json: @dialings, status: :ok
  end

  def metrics_overtime_employees
    # http://localhost:3000/api/metrics_overtime_employees/?start_date=2019-10-01&end_date=2019-10-31
    @dialings = EmployeeQueries.new.overtime_employees(params[:start_date],params[:end_date])
    authorize [@dialings]
    render json: @dialings, status: :ok

  end

  rescue_from ActiveRecord::RecordNotFound do |e|
    render json: { message: e.message }, status: :not_found
  end

  private
  def dialing_params
    params.permit(:date, :category, :hour, :minute, :user_id)
  end
end
