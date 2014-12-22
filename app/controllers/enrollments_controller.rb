class EnrollmentsController < ApplicationController
  before_action :authenticate_user!

  before_action :set_event
  before_action :set_runs
  before_action :set_run
  before_action :set_enrollment, only: [:show, :edit, :update, :destroy]

  # GET /enrollments
  # GET /enrollments.json
  def index
    @enrollments = Enrollment.all
  end

  # GET /enrollments/1
  # GET /enrollments/1.json
  def show
  end

  # GET /enrollments/new
  def new
    @enrollment = @run.enrollments.new
  end

  # GET /enrollments/1/edit
  def edit
  end

  # POST /enrollments
  # POST /enrollments.json
  def create
    @enrollment = @run.enrollments.new(enrollment_params)

    respond_to do |format|
      if @enrollment.save
        format.html { redirect_to @enrollment.run.event, notice: 'Enrollment was successfully created.' }
        format.json { render :show, status: :created, location: @enrollment }
      else
        format.html { render :new }
        format.json { render json: @enrollment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /enrollments/1
  # PATCH/PUT /enrollments/1.json
  def update
    respond_to do |format|
      if @enrollment.update(enrollment_params)
        format.html { redirect_to @enrollment, notice: 'Enrollment was successfully updated.' }
        format.json { render :show, status: :ok, location: @enrollment }
      else
        format.html { render :edit }
        format.json { render json: @enrollment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /enrollments/1
  # DELETE /enrollments/1.json
  def destroy
    @enrollment.destroy
    respond_to do |format|
      format.html { redirect_to enrollment.event, notice: 'Enrollment was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.

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
    
    # Never trust parameters from the scary internet, only allow the white list through.
    def enrollment_params
      params.require(:enrollment).permit(:run_id, :startnumber, :transponder, :finishtime, :runner_title, :runner_name, :runner_firstname, :runner_street, :runner_city, :runner_zip, :runner_country, :runner_date_of_birth, :runner_gender, :runner_contact, :runner_email, :runner_organisation)
    end
end
