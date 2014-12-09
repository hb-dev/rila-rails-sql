class Registration < ActiveRecord::Base
	belongs_to :run
	belongs_to :relay
	#validates :runner_name, :runner_firstname, :runner_gender, :runner_date_of_birth, presence:true
	#validates :runner_street, :runner_city, :runner_zip, :runner_country, :runner_email, presence:true, unless: "run.relay?"
	#validate :valid_age
	
	before_save :set_age_group

	scope "Männlich", -> {where(runner_gender: "Männlich")}
	scope "Weiblich", -> {where(runner_gender: "Weiblich")}
	
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
		[runner_title.to_s, runner_firstname, runner_name].reject(&:empty?).join(' ')
	end

	def age_groups
		{
			0 => 'minis',
			6 => 6,
			7 => 7,
			8 => 8,
			9 => 9,
			10 => 10,
			11 => 11,
			12 => 12,
			13 => 13,
			14 => 14,
			15 => 15,
			16 => 'JB',
			17 => 'JA',
			18 => 'HK',
			30 => 30,
			35 => 35,
			40 => 40,
			45 => 45,
			50 => 50,
			55 => 55,
			60 => 60,
			65 => 65,
			70 => 70,
			75 => 75,
			80 => 80,
			85 => 85
		}
	end

	def calculate_age_group
		age = age(runner_date_of_birth)
		gender = runner_gender[0,1]
		the_age_group = ""
		age_groups.each do |group|
			the_age_group = group[1] if group[0] <= age
		end
		gender + the_age_group.to_s
	end

	def set_age_group
		self.age_group = calculate_age_group
	end

	def price
		age = age(runner_date_of_birth)
		age_name = age <= 18 ? "child" : "adult"
		pre = Date.today < "#{run.event.event_date.year}-07-01".to_date ? "_pre" : ""
		price_method_name = "price_" + age_name + pre
		run.send(price_method_name)
	end

	def compeditors
		@compeditors ||= Registration.where(run_id: run.id)
	end

	def compeditors_in_front(compeditors)
		finishtime.nil? ? "" : compeditors.where("finishtime < ?", finishtime).count + 1
	end

	def compeditors_same_age_group
		self.compeditors.where(age_group: age_group)
	end

	def place		
		compeditors_in_front(self.compeditors)
	end

	def place_gender(gender)
		gender == runner_gender ? compeditors_in_front(self.compeditors.send(gender)) : ""
	end

	def place_age_group
		compeditors_in_front(self.compeditors_same_age_group)
	end

end
