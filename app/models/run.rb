class Run < ActiveRecord::Base
	belongs_to :event
	has_many :registrations
	has_many :relays

	validates :name, :min_age, :max_age, :price_adult_pre, :price_adult, :price_child_pre, :price_child, presence: true
end
