class CentralSchedule < ActiveRecord::Base
	attr_accessible :street, :delivery_person, :start_time, :end_time
end
