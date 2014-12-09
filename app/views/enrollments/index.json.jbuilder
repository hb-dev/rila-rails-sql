json.array!(@enrollments) do |enrollment|
  json.extract! enrollment, :id, :run_id, :startnumber, :transponder, :finishtime, :runner_title, :runner_name, :runner_firstname, :runner_street, :runner_city, :runner_zip, :runner_country, :runner_date_of_birth, :runner_gender, :runner_contact, :runner_email, :runner_organisation
  json.url enrollment_url(enrollment, format: :json)
end
