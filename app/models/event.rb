require 'securerandom'

class Event < ActiveRecord::Base
	
	extend FriendlyId
  friendly_id :random_id, use: :slugged

	has_many :runs
	has_many :enrollments
	has_many :relays

	validates :name, :event_date, presence: true

	def random_id
		SecureRandom.hex
	end

end
