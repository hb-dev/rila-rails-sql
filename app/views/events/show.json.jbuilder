json.name @event.name
json.date @event.event_date
json.runs @event.runs do |run|
	json.name run.name	
	json.registrations run.registrations do |registration|
		json.name registration.runner_display_name
	end
end