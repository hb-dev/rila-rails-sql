class Registration < ActiveRecord::Base
	belongs_to :run
	belongs_to :relay

	validates :runner_name, :runner_firstname, :runner_gender, :runner_date_of_birth, presence:true
	validates :runner_street, :runner_city, :runner_zip, :runner_country, :runner_email, presence:true, unless: "run.relay?"
	validate :valid_age
	
	def valid_age
		if !runner_date_of_birth.nil? 	
			event = run.event
			age = age(runner_date_of_birth)
			errors.add(:runner_date_of_birth, "Der Läufer muss am #{I18n.l event.event_date} zwischen #{run.min_age} und #{run.max_age} Jahren alt sein.") unless age.between?(run.min_age, run.max_age) 
		end
	end

	def age(dob)
		event = run.event
		event_date = event.event_date.to_time.utc.to_date
		event_date.year - dob.year - ((event_date.month > dob.month || (event_date.month == dob.month && event_date.day >= dob.day)) ? 0 : 1)
	end

	def runner_display_name
		[runner_title, runner_firstname, runner_name].reject(&:empty?).join(' ')
	end

end
