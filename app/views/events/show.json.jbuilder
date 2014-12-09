json.name @event.name
json.date @event.event_date
json.runs @event.runs do |run|
	json.name run.name	
	json.relay run.relay
	json.minis run.minis
	json.enrollments run.enrollments do |enrollment|
		json.startnumber enrollment.startnumber
		json.name enrollment.runner_display_name
		json.age_group enrollment.age_group
		json.finishtime enrollment.finishtime.blank? ? "" : (l enrollment.finishtime, format: :time)
		json.place enrollment.place
		json.place_male	enrollment.place_gender("Männlich")
		json.place_female	enrollment.place_gender("Weiblich")
		json.place_age_group enrollment.place_age_group
		json.organisation enrollment.runner_organisation
	end
	json.relays run.relays do |relay|
		json.name relay.name
		json.startnumber relay.startnumber
		json.runners relay.runners_string
		json.age_group relay.age_group
		json.finishtime relay.finishtime
		json.place relay.place
		json.place_age_group relay.place_age_group
	end
end