ActiveAdmin.register Item do
	index do
		column :name
		column :selling_price
		column :supply_price
		column :duke_price
		column :active
		default_actions
	end
	def active_enum
   [['Active'],['Inactive']]
	end
end
