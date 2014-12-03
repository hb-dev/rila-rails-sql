json.name @event.name
json.date @event.event_date
json.runs @event.runs do |run|
	json.name run.name	
end