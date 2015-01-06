class RunsController < ApplicationController

  before_action :authenticate_user!

  before_action :set_event
  before_action :set_run, only: [:show, :edit, :update, :destroy]

  def index
    @page_topic = "Läufe verwalten"
    @runs = @event.runs
  end

  def new
    @page_topic = "Lauf hinzufügen"
    @run = @event.runs.new
  end

  def create
    @page_topic = "Lauf hinzufügen"
    @run = @event.runs.new(run_params)

    if @run.save
      redirect_to event_runs_path(@event), notice: 'Lauf erfolgreich hinzugefügt.'
    else
      render :new
    end
  end

  def edit
    @page_topic = "Lauf bearbeiten"
  end

  def update
    @page_topic = "Lauf bearbeiten"
    if @run.update(run_params)
      redirect_to event_runs_path(@event), notice: 'Lauf erfolgreich aktualisiert.'
    else
      render :edit
    end
  end

  def destroy
    @run.destroy
    respond_to do |format|
      format.html { redirect_to event_runs_path(@event), notice: 'Lauf erfolgreich gelöscht.' }
      format.json { head :no_content }
    end
  end  

  private
  # Use callbacks to share common setup or constraints between actions.

  def set_event
    @event = Event.friendly.find(params[:event_id])
  end

  def set_run
    @run = @event.runs.friendly.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def run_params
    params.require(:run).permit(:name, :min_age, :max_age, :relay, :minis, :kids, :price_adult_pre, :price_adult, :price_child_pre, :price_child)
  end

end