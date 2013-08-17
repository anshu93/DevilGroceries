class Item < ActiveRecord::Base
	attr_accessible :name, :selling_price, :supply_price, :duke_price, :unit, :category_id,
	:subcategory_id, :image, :active, :fresh
	belongs_to :category
	belongs_to :subcategory
	has_many :orders, :through => :orderitemrelations
	has_many :orderitemrelations
	ITEM_STATUS = ['active', 'inactive']
	FRESH = ['yes', 'no']
	has_attached_file :image
	validates_with AttachmentPresenceValidator, :attributes => :image
	validates :name, :selling_price, :supply_price, :category_id, :active, presence: true 
	# filter for perishables
	scope :fresh, -> {where(fresh: "yes")}
end
