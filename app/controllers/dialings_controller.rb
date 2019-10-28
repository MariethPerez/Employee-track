class DialingsController < ApiController
   before_action :authorize_login, only: [:index,:show, :create, :update]
   
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

  private
  def dialing_params
    params.permit(:date, :category, :hour, :minute, :user_id)
  end
end
