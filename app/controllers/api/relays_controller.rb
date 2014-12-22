class API::RelaysController < API::BaseController

  wrap_parameters include: [:run_slug, :startnumber, :name, :contact_title, :contact_name, :contact_firstname, :contact_street, :contact_city, :contact_zip, :contact_country, :contact_email, :agb, :newsletter, :enrollments_attributes]

  def create
    @relay = Relay.new(relay_params)
    if @relay.save
      RegisterConfirmation.send_confirmation(@relay).deliver
      render json: @relay, status: :created
    else
      render json: @relay.errors, status: :unprocessable_entity
    end
  end

  private
    
  def relay_params
    params.require(:relay).permit(:run_slug, :startnumber, :name, :contact_title, :contact_name, :contact_firstname, :contact_street, :contact_city, :contact_zip, :contact_country, :contact_email, :agb, :newsletter, enrollments_attributes: [ :id, :runner_title, :runner_name, :runner_firstname, :runner_gender, :run_id, :event_id, :runner_date_of_birth, :run_slug])
  end

end
