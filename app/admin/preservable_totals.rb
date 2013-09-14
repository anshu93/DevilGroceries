ActiveAdmin.register_page "Preservable items" do
	content :title => proc{ "Preservable Item Totals" } do

		orders = Order.date.cart_status	#Filter for relevant orders
		items = Array.new
		quant_east = Array.new
		quant_west = Array.new
		quant_central = Array.new
		# Add all non fresh items to item array
		orders.each do |o|
			relations = o.orderitemrelations
			relations.each do |r|
				item = r.item
				if !items.include? item and item.fresh != "yes"
					items.push(item)
				end
			end
		end

		# populate the quant arrays with nothing
		for item in items
			quant_east.push("-")
			quant_west.push("-")
			quant_central.push("-")
		end
		# Initialise the east west and central order lists
		orders_east = Order.date.cart_status.east
		orders_west = Order.date.cart_status.west
		orders_central = Order.date.cart_status.central

		# EAST - not fresh
		items_total_east = Array.new
		quants_total_east = Array.new
		orders_east.each do |o|
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
				if !items_total_east.include? item
					items_total_east.push(item)
					quant = quant_per_order[hash_items_per_order[item]]
					quants_total_east.push(quant)
				else
					index_per_order = hash_items_per_order[item]
					hash_items_total_east = Hash[items_total_east.map.with_index.to_a]
					index_total = hash_items_total_east[item]
					quants_total_east[index_total] = quants_total_east[index_total] + quant_per_order[index_per_order]
				end
			end
		end

		#West - Not fresh
		items_total_west = Array.new
		quants_total_west = Array.new
		orders_west.each do |o|
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
				if !items_total_west.include? item
					items_total_west.push(item)
					quant = quant_per_order[hash_items_per_order[item]]
					quants_total_west.push(quant)
				else
					index_per_order = hash_items_per_order[item]
					hash_items_total_west = Hash[items_total_west.map.with_index.to_a]
					index_total = hash_items_total_west[item]
					quants_total_west[index_total] = quants_total_west[index_total] + quant_per_order[index_per_order]
				end
			end
		end

		#Central - not fresh
		items_total_central = Array.new
		quants_total_central = Array.new
		orders_central.each do |o|
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
				if !items_total_central.include? item
					items_total_central.push(item)
					quant = quant_per_order[hash_items_per_order[item]]
					quants_total_central.push(quant)
				else
					index_per_order = hash_items_per_order[item]
					hash_items_total_central = Hash[items_total_central.map.with_index.to_a]
					index_total = hash_items_total_central[item]
					quants_total_central[index_total] = quants_total_central[index_total] + quant_per_order[index_per_order]
				end
			end
		end

		hash_items = Hash[items.map.with_index.to_a]

		for item in items 
			index_items = hash_items[item]	#Index of item in overall list

			if items_total_east.include? item 	#This should always be true
				hash_items_total_east = Hash[items_total_east.map.with_index.to_a]
				index = hash_items_total_east[item]	#Index of item in the east list
				quant = quants_total_east[index]		#Quantity of item for east
				quant_east[index_items] = quant #Insert quant into quant_east at right idx
			end

			if items_total_west.include? item 	#This should always be true
				hash_items_total_west = Hash[items_total_west.map.with_index.to_a]
				index = hash_items_total_west[item]	#Index of item in the east list
				quant = quants_total_west[index]		#Quantity of item for east
				quant_west[index_items] = quant #Insert quant into quant_east at right idx
			end

			if items_total_central.include? item 	#This should always be true
				hash_items_total_central = Hash[items_total_central.map.with_index.to_a]
				index = hash_items_total_central[item]	#Index of item in the east list
				quant = quants_total_central[index]		#Quantity of item for east
				quant_central[index_items] = quant #Insert quant into quant_east at right idx
			end
		end

		columns do
			column do
				panel "Items needed this Sunday for campus" do
					table_for items do 
						column :name
						column("Quantity for East") {quant_east.shift }
						column("Quantity for West") {quant_west.shift }
						column("Quantity for Central") {quant_central.shift }
						column :unit
						column :supply_price
					end
				end
			end
		end

	end
end