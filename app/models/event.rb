require 'securerandom'

class Event < ActiveRecord::Base
	
	extend FriendlyId
  friendly_id :random_id, use: :slugged

	has_many :runs, dependent: :destroy
	has_many :enrollments, dependent: :destroy
	has_many :relays, dependent: :destroy

	validates :name, :event_date, presence: true

	def random_id
		SecureRandom.hex
	end

end
