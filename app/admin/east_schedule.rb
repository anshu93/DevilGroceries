ActiveAdmin.register EastSchedule do
	index do
		column :dorm
		column :delivery_person
		column :start_time
		column :end_time
		column :room
		default_actions
	end

end
