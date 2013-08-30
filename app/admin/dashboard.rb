ActiveAdmin.register_page "Dashboard" do
  	content :title => proc{ I18n.t("active_admin.dashboard") } do
		columns do
			column do
				panel "Orders for the coming Sunday" do
					table_for Order.date.cart_status do
						column :user_id do |order|
							link_to order.user_id, admin_order_path(order)
						end
						column :campus
						column :building
						column :room
						column :house
						column :total
					end
					strong { link_to "View All orders", admin_orders_path }
				end
			end
		end
	end
end