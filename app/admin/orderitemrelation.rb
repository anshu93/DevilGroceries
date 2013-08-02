ActiveAdmin.register Orderitemrelation do
	index do
		selectable_column
		column :order_id
		column "Item Name" do |orderitemrelation|
			orderitemrelation.item.name
		end
		column :quantity
		default_actions
	end
end
