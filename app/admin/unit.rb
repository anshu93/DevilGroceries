ActiveAdmin.register Unit do
	index do
		column :unit_name 
		default_actions
	end

	show :title => :unit_name
end
