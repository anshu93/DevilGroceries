class Order < ActiveRecord::Base
	attr_accessible :id, :user_id, :campus, :building, :room, :email, :phone, :date, :time, :status, :cart_status, :total, :house, :delivery_date
	has_many :items, :through => :orderitemrelations
	has_many :orderitemrelations
	ORDER_STATUS = ['DELIVERED', 'UNDELIVERED', 'ATTEMPTED']
	CAMPUS = ['West', 'East', 'Central']
	BUILDING = ['Few', 'Kilgo', 'Edens']
	CART_STATUS = ['pending', 'confirmed']
	def display_name
		id 
	end	
	# filter if applicable for this sunday
	scope :date, -> {where(delivery_date = ?", (Date.today.end_of_week))}
	# filter by east dorm
	scope :alspaugh, -> {where(building: "Alspaugh")}
	scope :aycock, -> {where(building: "Aycock")}
	scope :bassett, -> {where(building: "Bassett")}
	scope :belltower, -> {where(building: "Bell Tower")}
	scope :blackwell, -> {where(building: "Blackwell")}
	scope :brown, -> {where(building: "Brown")}
	scope :epworth, -> {where(building: "Epworth")}
	scope :ga, -> {where(building: "Gilbert-Addoms")}
	scope :giles, -> {where(building: "Giles")}
	scope :jarvis, -> {where(building: "Jarvis")}
	scope :pegram, -> {where(building: "Pegram")}
	scope :randolph, -> {where(building: "Randolph")}
	scope :southgate, -> {where(building: "Southgate")}
	scope :wilson, -> {where(building: "Wilson")}

	# filter by west dorm
	scope :cart_status, -> {where(cart_status: "confirmed")}
	scope :few, -> {where(building: "Few")}
	scope :kilgo, -> {where(building: "Kilgo")}
	scope :edens, -> {where(building: "Edens")}
	scope :craven, -> {where(building: "Craven")}
	scope :crowell, -> {where(building: "Crowell")}
	scope :keohane, -> {where(building: "Keohane")}
	scope :wannamaker, -> {where(building: "Wannamaker")}
	# filter by campus
	scope :west, -> {where(campus: "West")}
	scope :east, -> {where(campus: "East")}
	scope :central, -> {where(campus: "Central")}

	validates :user_id, :campus, :building, presence: true
end
