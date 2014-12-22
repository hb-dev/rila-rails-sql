class API::EnrollmentsController < API::BaseController

  wrap_parameters include: [:run_slug, :startnumber, :transponder, :finishtime, :runner_title, :runner_name, :runner_firstname, :runner_street, :runner_city, :runner_zip, :runner_country, :runner_date_of_birth, :runner_gender, :runner_contact, :runner_email, :runner_organisation, :agb, :newsletter]

  def create
    @enrollment = Enrollment.new(enrollment_params)
    if @enrollment.save
      RegisterConfirmation.send_confirmation(@enrollment).deliver
      render json: @enrollment, status: :created
    else
      render json: @enrollment.errors, status: :unprocessable_entity
    end
  end

  
      
  def enrollment_params
    params.require(:enrollment).permit(permitted_params)
  end

  def permitted_params
    [:run_slug, :startnumber, :transponder, :finishtime, :runner_title, :runner_name, :runner_firstname, :runner_street, :runner_city, :runner_zip, :runner_country, :runner_date_of_birth, :runner_gender, :runner_contact, :runner_email, :runner_organisation, :agb, :newsletter]
  end

end
