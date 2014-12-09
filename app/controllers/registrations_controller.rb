class RegistrationsController < ApplicationController
  before_action :authenticate_user!

  before_action :set_event
  before_action :set_runs
  before_action :set_run
  before_action :set_registration, only: [:show, :edit, :update, :destroy]

  # GET /registrations
  # GET /registrations.json
  def index
    @registrations = Registration.all
  end

  # GET /registrations/1
  # GET /registrations/1.json
  def show
  end

  # GET /registrations/new
  def new
    @registration = @run.registrations.new
  end

  # GET /registrations/1/edit
  def edit
  end

  # POST /registrations
  # POST /registrations.json
  def create
    @registration = @run.registrations.new(registration_params)

    respond_to do |format|
      if @registration.save
        format.html { redirect_to @registration.run.event, notice: 'Registration was successfully created.' }
        format.json { render :show, status: :created, location: @registration }
      else
        format.html { render :new }
        format.json { render json: @registration.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /registrations/1
  # PATCH/PUT /registrations/1.json
  def update
    respond_to do |format|
      if @registration.update(registration_params)
        format.html { redirect_to @registration, notice: 'Registration was successfully updated.' }
        format.json { render :show, status: :ok, location: @registration }
      else
        format.html { render :edit }
        format.json { render json: @registration.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /registrations/1
  # DELETE /registrations/1.json
  def destroy
    @registration.destroy
    respond_to do |format|
      format.html { redirect_to registration.event, notice: 'Registration was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.

    def set_event
      @event = Event.find(params[:event_id])
    end
    
    def set_registration
      @registration = @event.registrations.find(params[:id])
    end

    def set_runs      
      @runs = @event.runs.collect{|r| [r.name, r.id]}
    end

    def set_run
      @run = @event.runs.find(params[:run_id])
    end
    
    # Never trust parameters from the scary internet, only allow the white list through.
    def registration_params
      params.require(:registration).permit(:run_id, :startnumber, :transponder, :finishtime, :runner_title, :runner_name, :runner_firstname, :runner_street, :runner_city, :runner_zip, :runner_country, :runner_date_of_birth, :runner_gender, :runner_contact, :runner_email, :runner_organisation)
    end
end
