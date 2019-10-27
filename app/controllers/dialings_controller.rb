class DialingsController < ApiController
    # before_action :authorize, only: [:index,:show, :create, :new]
  def index
    render json: Dialing.all
  end

  def show
    @dialing = Dialing.find(params[:id])
    render json: @dialing
  end

  def create
    dialing = Dialing.new(dialing_params)
    if dialing.save
      render json: dialing, status: :created
    else
      render json:  dialing.errors, status: :bad_request
    end
  end

  def update
    dialing = Dialing.find(params[:id])
    if dialing.update(dialing_params)
      render json: dialing, status: :ok
    else
      render json:  dialing.errors, status: :bad_request
    end
  end

  private
  def dialing_params
    params.permit(:date, :category, :hour, :minute, :user_id)
  end
end
