class Order < ActiveRecord::Base
	attr_accessible :id, :user_id, :campus, :building, :room, :email, :phone, :date, :time, :status, :cart_status
	has_many :items, :through => :orderitemrelations
	has_many :orderitemrelations
	ORDER_STATUS = ['DELIVERED', 'UNDELIVERED', 'ATTEMPTED']
	CAMPUS = ['West', 'East', 'Central']
	BUILDING = ['Few', 'Kilgo', 'Edens']
	CART_STATUS = ['pending', 'confirmed']
	def display_name
		id 
	end	
	scope :date, -> {where("date < ?", (Date.today.end_of_week - 1).strftime("%m/%d/%Y"))}
	scope :cart_status, -> {where(cart_status: "confirmed")}

	validates :user_id, :campus, :building, presence: true
end
