class API::RunsController < API::BaseController

  respond_to :json

  def index
    @runs = Event.order("event_date desc").first.runs
  end

  def show
    @run = Run.friendly.find(params[:id])
  end  
    
end
