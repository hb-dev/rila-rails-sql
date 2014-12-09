class Relay < ActiveRecord::Base
	belongs_to :run
	has_many :registrations
	accepts_nested_attributes_for :registrations

#	validates :name, :contact_name, :contact_firstname, :contact_street, :contact_city, :contact_zip, :contact_country, :contact_email, presence: true

	before_save :set_age_group

	def runners_string
		registrations.map(&:runner_display_name).join(', ')
	end

	def finishtime
		"00:00:00".to_time + self.registrations.map(&:finishtime).sum{|x| x.nil? ? 0 : x.to_i}
	end

	def set_age_group
		case registrations.map(&:runner_gender).uniq
		when ["Männlich"]
			self.age_group = 'M-Staffel'
		when ["Weiblich"]
			self.age_group = 'W-Staffel'
		else
			self.age_group = 'Mix-Staffel'
		end
	end

	def compeditors
		@compeditors ||= Relay.where(run_id: run.id)
	end

	def compeditors_in_front(compeditors)
		compeditors.select{ |compeditor| compeditor.finishtime < self.finishtime }
	end

	def compeditors_same_age_group
		self.compeditors.where(age_group: age_group)
	end

	def place		
		compeditors_in_front(self.compeditors).count + 1
	end

	def place_age_group
		compeditors_in_front(self.compeditors_same_age_group).count + 1 
	end

end
