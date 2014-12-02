class Relay < ActiveRecord::Base
	belongs_to :run
	has_many :registrations
	accepts_nested_attributes_for :registrations

	validates :name, :contact_name, :contact_firstname, :contact_street, :contact_city, :contact_zip, :contact_country, :contact_email, presence: true

end
