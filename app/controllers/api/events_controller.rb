class API::EventsController < API::BaseController

  #respond_to :json

  before_action :set_event, only: [:show, :edit, :update, :destroy, :select_run]

  def index
    @events = Event.all
  end

  def show
  end

  def new
    @event = Event.new
  end

  def edit
  end

  def create
    @event = Event.new(event_params)
    if @event.save
      render :show, status: :created, location: @event
    else
      render json: @event.errors, status: :unprocessable_entity
    end
  end

  def update
    if @event.update(event_params)
      render :show, status: :ok, location: @event
    else
      render json: @event.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @event.destroy
    head :no_content
  end

  def select_run
    @runs = @event.runs
  end  

  private

  def set_event
    @event = Event.find(params[:id])
  end

  def event_params
    params.require(:event).permit(:name, :event_date)
  end
    
end
