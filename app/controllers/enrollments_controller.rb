class EnrollmentsController < ApplicationController
  before_action :authenticate_user!

  before_action :set_event, except: [:update_payed, :update_picked_up]
  before_action :set_runs, except: [:update_payed, :update_picked_up, :edit, :update]
  before_action :set_run, except: [:update_payed, :update_picked_up]
  before_action :set_enrollment, only: [:show, :edit, :update, :destroy]

  include Pickupable

  def index
    @page_topic = "Anmeldungen"
    @enrollments = Enrollment.all
  end

  def show
    @page_topic = "Anmeldung anzeigen"
  end

  def new
    @page_topic = "Neue Anmeldung"
    @enrollment = @run.enrollments.new
  end

  def edit
    @page_topic = "Anmeldung bearbeiten"
    @runs = @event.runs.where(relay: false).collect{|r| [r.name, r.id]}
  end

  def create
    @page_topic = "Neue Anmeldung"
    @enrollment = @run.enrollments.new(enrollment_params)

    respond_to do |format|
      if @enrollment.save
        format.html { redirect_to edit_event_run_enrollment_path(@event, @run, @enrollment), notice: 'Anmeldung erfolgreich erstellt.' }
        format.json { render :show, status: :created, location: @enrollment }
      else
        format.html { render :new }
        format.json { render json: @enrollment.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @page_topic = "Anmeldung bearbeiten"
    @runs = @event.runs.where(relay: false).collect{|r| [r.name, r.id]}
    respond_to do |format|
      if @enrollment.update(enrollment_params)
        format.html { redirect_to event_run_enrollment_path(@event, @run, @enrollment), notice: 'Anmeldung erfolgreich aktualisiert.' }
        format.json { render :show, status: :ok, location: @enrollment }
      else
        format.html { render :edit }
        format.json { render json: @enrollment.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @enrollment.destroy
    respond_to do |format|
      format.html { redirect_to @event, notice: 'Anmeldung erfolgreich gelöscht.' }
      format.json { head :no_content }
    end
  end

  private

  def set_event
    @event = Event.friendly.find(params[:event_id])
  end
  
  def set_enrollment
    @enrollment = @event.enrollments.find(params[:id])
  end

  def set_runs      
    @runs = @event.runs.collect{|r| [r.name, r.id]}
  end

  def set_run
    @run = @event.runs.friendly.find(params[:run_id])
  end
  
  def enrollment_params
    params.require(:enrollment).permit(:run_id, :startnumber, :transponder, :finishtime, :runner_title, :runner_name, :runner_firstname, :runner_street, :runner_city, :runner_zip, :runner_country, :runner_date_of_birth, :runner_gender, :runner_contact, :runner_email, :runner_organisation)
  end

end
