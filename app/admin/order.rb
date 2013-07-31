ActiveAdmin.register Order do
	index do
		column :id 
		column :user_id do |order|
			link_to order.user_id, admin_order_path(order)
		end
		column :campus
		column :building
		column :room
		column :phone
		column :date
		column :time
		column :status
		default_actions
	end

	form do |f|
		f.inputs "Enter Order details" do
			f.input :user_id
			f.input :campus, :label => "campus", :as => :select, :collection => Order::CAMPUS
			f.input :building, :label => "building", :as => :select, :collection => Order::BUILDING
			f.input :room
			f.input :phone
			f.input :status, :label => "STATUS", :as => :select, :collection => Order::ORDER_STATUS
		end
		f.buttons
	end

	show :title => :user_id do
		panel "Order Details" do
			table_for order.orderitemrelations do 
				column "item" do |orderitemrelation|
					orderitemrelation.item.name
				end
				column "unit" do |orderitemrelation|
					orderitemrelation.item.unit.unit_name
				end
			end
		end
	end
end
