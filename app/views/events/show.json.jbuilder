json.name @event.name
json.date @event.event_date
json.runs @event.runs do |run|
	json.name run.name	
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
end