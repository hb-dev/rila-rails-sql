class Relay < ActiveRecord::Base
	belongs_to :run
	has_many :enrollments

	accepts_nested_attributes_for :enrollments

	validates :name, :contact_name, :contact_firstname, :contact_street, :contact_city, :contact_zip, :contact_country, presence: true
	validates :contact_email, email: true, presence:true
	validates :enrollments, length: { is: 4 }
	validates :agb, acceptance: { accept: true }
	validate :date_expired

	include Publicidable

	before_validation :set_run_id
	before_save :set_age_group
	before_save :set_event_id

	def date_expired
		errors.add(:base, "Der Anmeldezeitraum ist abgelaufen.") if Time.now.to_date >= run.event.event_date
	end

	def runners_string
		enrollments.map(&:runner_display_name).join(', ')
	end

	def finishtime
		"00:00:00".to_time + self.enrollments.map(&:finishtime).sum{|x| x.nil? ? 0 : x.to_i}
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

	def price
		price_relay = 0
		self.enrollments.each do |enrollment|
			age_name = enrollment.age <= 18 ? "child" : "adult"
			pre = Date.today < "#{run.event.event_date.year}-07-01".to_date ? "_pre" : ""
			price_method_name = "price_" + age_name + pre
			price_relay += run.send(price_method_name)
		end
		price_relay			
	end	
	
	def as_json options={}
	  {
	    id: public_id,
	    price: ActionController::Base.helpers.number_to_currency(price),
	    email: contact_email
	  }
	end

	def public_name
		"STAFFEL"
	end

	private

	def set_age_group
		case enrollments.map(&:runner_gender).uniq
		when ["Männlich"]
			self.age_group = 'M-Staffel'
		when ["Weiblich"]
			self.age_group = 'W-Staffel'
		else
			self.age_group = 'Mix-Staffel'
		end
	end

	def set_run_id
		self.run_id = run_slug ? Run.friendly.find(run_slug).id : run_id
	end

	def set_event_id
		self.event_id = self.run.event_id
	end

end
