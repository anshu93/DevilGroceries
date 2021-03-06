ActiveAdmin.register Order do
	index do
		selectable_column
		column :id 
		column :user_id do |order|
			link_to order.user_id, admin_order_path(order)
		end
		column :campus
		column :building
		column :room
		column :house
		column :phone
		column :email
		column :delivery_date
		column :total
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
			f.input :house
			f.input :phone
			f.input :email
			f.input :date
			f.input :time
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
				row("house") { order.house }
				row("building") { order.building }
				row("campus") { order.campus }
				row("email address") { order.email + "@duke.edu" }
				row("phone number") { order.phone }
				row("time ordered") { order.time }
				row("date ordered") { order.date }
				row("date of delivery") { order.delivery_date }
				if order.total != nil
				row("subtotal") {number_to_currency(order.total, :precision => 2)}
				row("delivery") {"+ $3.99"}
				row("total") {number_to_currency(order.total + 3.99, :precision => 2)}
				else
				row("subtotal") {"-"}
				row("delivery") {"-"}
				row("total") {"-"}
				end
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
					orderitemrelation.item.unit
				end
			end
		end
	end
end
