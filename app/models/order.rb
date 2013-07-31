class Order < ActiveRecord::Base
	attr_accessible :user_id, :campus, :building, :room, :email, :phone, :date, :time, :status
	has_many :items, :through => :orderitemrelation
end
