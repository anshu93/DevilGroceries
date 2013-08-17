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
	# filter if applicable for this sunday
	scope :date, -> {where("date < ? and date > ?", (Date.today.end_of_week - 1).strftime("%m/%d/%Y"), (Date.today.last_week.end_of_week - 2).strftime("%m/%d/%Y"))}
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
