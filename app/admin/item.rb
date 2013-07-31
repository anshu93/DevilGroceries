ActiveAdmin.register Item do
	index do
		column :name
		column :selling_price
		column :supply_price
		column :duke_price
		column :active
		default_actions
	end

	form do |f|
		f.inputs "Item details" do
			f.input :name
			f.input :selling_price
			f.input :supply_price
			f.input :duke_price
			f.input :category
			f.input :subcategory
			f.input :unit
			f.input :active, :label => "status", :as => :select, :collection => Item::ITEM_STATUS
		end
		f.buttons
	end
end
