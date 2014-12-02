class Run < ActiveRecord::Base
	belongs_to :event
	has_many :registrations
	has_many :relays

	validates :name, presence: true
end
