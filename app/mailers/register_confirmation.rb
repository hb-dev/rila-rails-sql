class RegisterConfirmation < ActionMailer::Base
  default from: "anmeldung@ringelnatzlauf.de"

  def send_confirmation(registration)
    @registration = registration.as_json
    mail( to: @registration[:email], subject: 'Anmeldung zum Ringelnatzlauf' )
  end


end