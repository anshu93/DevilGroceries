class Subcategory < ActiveRecord::Base
	attr_accessible :id, :subcategory_name, :category_id
	has_many :items
	belongs_to :category
	def display_name
		subcategory_name
	end
end
