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
		column :email
		column :date
		column :time
		column :status
		column :cart_status
		default_actions
	end

	scope :confirmed_order, :default => true do |order|
		order.where( :cart_status => "confirmed")
	end
	scope :all
	scope :cart_orders do |order|
		order.where( :cart_status => "pending" )
	end

	form do |f|
		f.inputs "Enter Order details" do
			f.input :user_id
			f.input :campus, :label => "campus", :as => :select, :collection => Order::CAMPUS
			f.input :building, :label => "building", :as => :select, :collection => Order::BUILDING
			f.input :room
			f.input :phone
			f.input :email
			f.input :status, :label => "STATUS", :as => :select, :collection => Order::ORDER_STATUS
			f.input :cart_status, :label => "CART STATUS", :as => :select, :collection => Order::CART_STATUS

		end
		f.actions
	end

	show :title => :user_id do
		panel "Order details" do
			attributes_table_for order do
				row("user") { order.user_id }
				row("room") { order.room }
				row("building") { order.building }
				row("campus") { order.campus }
				row("phone number") { order.phone }
				row("time ordered") { order.time }
				row("date ordered") { order.date }
				row("status") { order.status }
			end
		end
		panel "Ordered Items" do
			table_for order.orderitemrelations do 
				column "item" do |orderitemrelation|
					orderitemrelation.item.name
				end
				column "quantity" do |orderitemrelation|
					orderitemrelation.quantity
				end
				column "unit" do |orderitemrelation|
					orderitemrelation.item.unit.unit_name
				end
			end
		end
	end
end
