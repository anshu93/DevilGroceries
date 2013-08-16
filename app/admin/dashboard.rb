ActiveAdmin.register_page "Dashboard" do
	content :title => proc{ I18n.t("active_admin.dashboard") } do
		columns do
			column do
				panel "Recent Orders" do
					table_for Order.where(cart_status: "confirmed").where(date: Date.today.strftime("%m/%d/%Y") - 2.day) do
						column :user_id 
						column :campus
						column :cart_status
						column :date
					end
					strong { link_to "View All orders", admin_orders_path }
				end
			end
		end
	end
end
