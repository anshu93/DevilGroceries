ActiveAdmin.register_page "West Orders" do
	content :title => proc{ "West Orders" } do
		columns do
			column do


				panel "FEW" do
					table_for Order.date.cart_status.few do
						column :user_id do |order|
							link_to order.user_id, admin_order_path(order)
						end
						column :room
						column :total
					end
					strong { link_to "View All orders", admin_orders_path }
				end

				panel "KILGO" do
					table_for Order.date.cart_status.kilgo do
						column :user_id do |order|
							link_to order.user_id, admin_order_path(order)
						end
						column :room
						column :total
					end
					strong { link_to "View All orders", admin_orders_path }
				end

				panel "KEOHANE" do
					table_for Order.date.cart_status.keohane do
						column :user_id do |order|
							link_to order.user_id, admin_order_path(order)
						end
						column :room
						column :total
					end
					strong { link_to "View All orders", admin_orders_path }
				end


				panel "WANNAMAKER" do
					table_for Order.date.cart_status.wannamaker do
						column :user_id do |order|
							link_to order.user_id, admin_order_path(order)
						end
						column :room
						column :total
					end
					strong { link_to "View All orders", admin_orders_path }
				end

				panel "CRAVEN" do
					table_for Order.date.cart_status.craven do
						column :user_id do |order|
							link_to order.user_id, admin_order_path(order)
						end
						column :room
						column :total
					end
					strong { link_to "View All orders", admin_orders_path }
				end

				panel "CROWELL" do
					table_for Order.date.cart_status.crowell do
						column :user_id do |order|
							link_to order.user_id, admin_order_path(order)
						end
						column :room
						column :total
					end
					strong { link_to "View All orders", admin_orders_path }
				end


				panel "EDENS" do
					table_for Order.date.cart_status.edens do
						column :user_id do |order|
							link_to order.user_id, admin_order_path(order)
						end
						column :room
						column :total
					end
					strong { link_to "View All orders", admin_orders_path }
				end

			end
		end
	end
end