ActiveAdmin.register Orderitemrelation do
	index do
		column :order_id
		column "Item Name" do |orderitemrelation|
			orderitemrelation.item.name
		end
		column :quantity
		default_actions
	end
end
