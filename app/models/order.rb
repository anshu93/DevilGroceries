class Order < ActiveRecord::Base
	attr_accessible :id, :user_id, :campus, :building, :room, :email, :phone, :date, :time, :status, :cart_status
	has_many :items, :through => :orderitemrelations
	has_many :orderitemrelations
	ORDER_STATUS = ['DELIVERED', 'UNDELIVERED', 'ATTEMPTED']
	CAMPUS = ['West', 'East', 'Central']
	BUILDING = ['Few', 'Kilgo', 'Edens']
	def display_name
		id 
	end	
	CART_STATUS = ['pending', 'confirmed']
end
