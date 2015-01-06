require 'securerandom'

class Run < ActiveRecord::Base
	
	extend FriendlyId
  friendly_id :random_id, use: :slugged

	belongs_to :event
	has_many :enrollments, dependent: :destroy
	has_many :relays, dependent: :destroy

	validates :name, :min_age, :max_age, :price_adult_pre, :price_adult, :price_child_pre, :price_child, presence: true

	def random_id
		SecureRandom.hex
	end

end
