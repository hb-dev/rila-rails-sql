class Event < ActiveRecord::Base
	has_many :runs
	has_many :registrations
end
