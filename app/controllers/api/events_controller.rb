class API::EventsController < API::BaseController

  respond_to :json

  def index
    @events = Event.where("event_date <= ?", Time.now)
  end

  def show
    @event = Event.friendly.find(params[:id])
  end

  def latest
    @event = Event.order("event_date desc").first
  end  
    
end
