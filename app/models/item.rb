class Item < ActiveRecord::Base
	attr_accessible :name, :selling_price, :supply_price, :duke_price, :unit_id, :category_id,
	:subcategory_id, :image, :active
	belongs_to :category
	belongs_to :unit
	belongs_to :subcategory
end
