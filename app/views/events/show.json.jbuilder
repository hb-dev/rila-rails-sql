json.name @event.name
json.date @event.event_date
json.runs @event.runs do |run|
	json.name run.name	
	json.registrations run.registrations do |registration|
		json.startnumber registration.startnumber
		json.name registration.runner_display_name
		json.age_group registration.age_group
		json.finishtime registration.finishtime.blank? ? "" : (l registration.finishtime, format: :time)
		json.place registration.place
		json.place_male	registration.place_gender("Männlich")
		json.place_female	registration.place_gender("Weiblich")
		json.place_age_group registration.place_age_group
		json.organisation registration.runner_organisation
	end
end