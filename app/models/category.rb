class Category < ActiveRecord::Base
	attr_accessible :id, :category_name
	has_many :items
	has_many :subcategories
	def display_name
		category_name
	end
	validates :category_name, presence: true
end
