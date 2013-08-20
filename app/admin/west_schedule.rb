ActiveAdmin.register WestSchedule do
	index do
		column :dorm
		column :delivery_person
		column :start_time
		column :end_time
		default_actions
	end

end
