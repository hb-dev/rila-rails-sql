json.cache! do
	json.name @event.name
	json.date l @event.event_date
	json.runs @event.runs do |run|
		json.name run.name	
		json.relay run.relay
		json.minis run.minis
		json.enrollments run.enrollments.where(relay_id: nil).order(:finishtime) do |enrollment|
			json.startnumber enrollment.startnumber
			json.name enrollment.runner_display_name
			json.age_group enrollment.age_group
			json.finishtime enrollment.finishtime.blank? ? "" : (l enrollment.finishtime, format: :time)
			json.place enrollment.place
			json.place_male	enrollment.place_gender("Männlich")
			json.place_female	enrollment.place_gender("Weiblich")
			json.place_age_group enrollment.place_age_group
			json.organisation enrollment.runner_organisation
			json.certificate_url run.minis ? "http://ringelnatzlauf.de/images/Urkunde_Minilauf.pdf" : certificate_link(enrollment)
		end
		json.relays run.relays.to_a.sort_by(&:finishtime) do |relay|
			json.name relay.name
			json.startnumber relay.startnumber
			json.runners relay.runners_string
			json.age_group relay.age_group
			json.finishtime (l relay.finishtime, format: :time)
			json.place relay.place
			json.place_age_group relay.place_age_group
			json.certificate_url certificate_link_relay(relay)
		end
	end
end