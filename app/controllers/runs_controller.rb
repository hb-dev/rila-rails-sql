class RunsController < ApplicationController

  before_action :authenticate_user!

  before_action :set_event
  before_action :set_run, only: [:show, :edit, :update, :destroy]

  def index
    @runs = @event.runs
  end

  def new
    @run = @event.runs.new
  end

  def create
    @run = @event.runs.new(run_params)

    if @run.save
      redirect_to event_runs_path(@event), notice: 'Run was successfully added.'
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @run.update(run_params)
      redirect_to event_runs_path(@event), notice: 'Run was successfully updated.'
    else
      render :edit
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.

  def set_event
    @event = Event.find(params[:event_id])
  end

  def set_run
    @run = @event.runs.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def run_params
    params.require(:run).permit(:name, :min_age, :max_age, :relay, :price_adult_pre, :price_adult, :price_child_pre, :price_child)
  end

end