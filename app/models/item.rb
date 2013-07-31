class Item < ActiveRecord::Base
	attr_accessible :name, :selling_price, :supply_price, :duke_price, :unit_id, :category_id,
	:subcategory_id, :image, :active
	belongs_to :category
	belongs_to :unit
	belongs_to :subcategory
	has_many :orders, :through => :orderitemrelations
	has_many :orderitemrelations
	ITEM_STATUS = ['active', 'inactive']
	has_attached_file :image
	# validates_with AttachmentPresenceValidator, :attributes => :image
end
