class EventsController < ApplicationController

  before_action :authenticate_user!

  before_action :set_event, only: [:show, :edit, :update, :destroy, :select_run, :copy_runs, :results]

  def index
    @page_topic = "Veranstaltungen"
    @events = Event.all
  end

  def show
    @page_topic = "Anmeldungen"
  end

  def new
    @page_topic = "Neue Veranstaltung"
    @event = Event.new
  end

  def edit
    @page_topic = "Veranstaltung bearbeiten"
  end

  def create
    @page_topic = "Neue Veranstaltung"
    @event = Event.new(event_params)

    respond_to do |format|
      if @event.save
        format.html { redirect_to @event, notice: 'Veranstaltung erfolgreich erstellt.' }
        format.json { render :show, status: :created, location: @event }
      else
        format.html { render :new }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /events/1
  # PATCH/PUT /events/1.json
  def update
    respond_to do |format|
      if @event.update(event_params)
        format.html { redirect_to @event, notice: 'Veranstaltung erfolgreich aktualisiert.' }
        format.json { render :show, status: :ok, location: @event }
      else
        format.html { render :edit }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /events/1
  # DELETE /events/1.json
  def destroy
    @event.destroy
    respond_to do |format|
      format.html { redirect_to events_url, notice: 'Veranstaltung erfolgreich gelöscht.' }
      format.json { head :no_content }
    end
  end

  def select_run
    @page_topic = "Neue Anmeldung"
    @runs = @event.runs
  end  


  def copy_runs
    previous_event = Event.where("event_date < ?", @event.event_date).order("event_date desc").first
    previous_event.runs.each do |prev_run|
      new_run = prev_run.dup
      new_run.event_id = @event.id
      new_run.save
    end
    redirect_to event_runs_path(@event)
  end

  def results
    @page_topic = "Ergebnisse"
  end  

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_event
      @event = Event.friendly.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def event_params
      params.require(:event).permit(:name, :event_date)
    end

    def format_json?
      request.format.json?
    end

end
