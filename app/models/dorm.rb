class Dorm < ActiveRecord::Base
	belongs_to :campus
	has_many :orders
	attr_accessible :id, :dorm_name, :campus_id
	def display_name
		dorm_name
	end
	validates :dorm_name, :campus_id, presence: true
end
