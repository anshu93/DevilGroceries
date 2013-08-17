ActiveAdmin.register_page "Total Items for WEST campus" do

	content :title => proc{ "Item totals for west" } do
		orders = Order.date.cart_status.west
		items_total = Array.new
		quants_total = Array.new
		orders.each do |o|
			items_per_order = Array.new
			quant_per_order = Array.new
			relation = o.orderitemrelations
			relation.each do |r|
				if r.item.fresh != "yes"
					items_per_order.push(r.item)
					quant_per_order.push(r.quantity)
				end
			end
			for item in items_per_order 
				hash_items_per_order = Hash[items_per_order.map.with_index.to_a]
				if !items_total.include? item
					items_total.push(item)
					quant = quant_per_order[hash_items_per_order[item]]
					quants_total.push(quant)
				else
					index_per_order = hash_items_per_order[item]
					hash_items_total = Hash[items_total.map.with_index.to_a]
					index_total = hash_items_total[item]
					quants_total[index_total] = quants_total[index_total] + quant_per_order[index_per_order]

				end
			end
		end


			orders = Order.date.cart_status.west
			items_fresh_total = Array.new
			quants_fresh_total = Array.new
			orders.each do |o|
				items_fresh_per_order = Array.new
				quant_fresh_per_order = Array.new
				relation = o.orderitemrelations
				relation.each do |r|
					if r.item.fresh == "yes"
						items_fresh_per_order.push(r.item)
						quant_fresh_per_order.push(r.quantity)
					end
				end
				for item in items_fresh_per_order 
					hash_fresh_items_per_order = Hash[items_fresh_per_order.map.with_index.to_a]
					if !items_fresh_total.include? item
						items_fresh_total.push(item)
						quant = quant_fresh_per_order[hash_fresh_items_per_order[item]]
						quants_fresh_total.push(quant)
					else
						index_fresh_per_order = hash_fresh_items_per_order[item]
						hash_fresh_items_total = Hash[items_fresh_total.map.with_index.to_a]
						index_fresh_total = hash_fresh_items_total[item]
						quants_fresh_total[index_fresh_total] = quants_fresh_total[index_fresh_total] + quant_fresh_per_order[index_fresh_per_order]
					end
				end
			end

			columns do
				column do

					panel "FRESH items for WEST campus" do
						table_for items_fresh_total do 
							column :name 
							column("Quantity") {quants_fresh_total.shift }
						end
					end

					panel "Total items needed this Sunday for WEST campus" do
						table_for items_total do 
							column :name 
							column("Quantity") {quants_total.shift }
						end
					end
				end
			end
		end
	end
