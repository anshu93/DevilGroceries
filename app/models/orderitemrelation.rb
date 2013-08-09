class Orderitemrelation < ActiveRecord::Base
	default_scope order('id ASC')
	attr_accessible :order_id, :item_id, :quantity
	belongs_to :order
	belongs_to :item
	validates :order_id, :item_id, :quantity, presence: true
end
