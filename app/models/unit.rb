class Unit < ActiveRecord::Base
	attr_accessible :unit_name
	has_many :items
	def display_name
		unit_name
	end
end
