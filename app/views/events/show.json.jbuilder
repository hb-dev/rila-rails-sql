json.cache! [@event] do
	json.name @event.name
	json.date l @event.event_date
	json.runs @event.runs do |run|
		json.name run.name	
		json.relay run.relay
		json.minis run.minis
		json.enrollments run.enrollments.reject{|en| !en.relay_id.nil?} do |enrollment|
			json.startnumber enrollment.startnumber
			json.name enrollment.runner_display_name
			json.age_group enrollment.age_group
			json.organisation enrollment.runner_organisation
			json.public_id enrollment.public_id
		end
		json.relays run.relays do |relay|
			json.name relay.name
			json.startnumber relay.startnumber
			json.runners relay.runners_string
			json.age_group relay.age_group
			json.public_id relay.public_id
		end
	end
end