class ShoppingController < ApplicationController
	def home
		@category = Category.all
		@subcategory = Subcategory.all
		if cookies[:id] != nil and Order.exists?(cookies[:id])
			order_id = cookies[:id]
			@relation = Order.find(order_id).orderitemrelations.length
		else
			@relation = 0
		end
	end

	def result
		if params[:category_id] == "-1"
			@item = Item.where(active: "active").order("RANDOM()")
		elsif params[:category_id] != nil
			@item = Category.find(params[:category_id]).items.where(active: "active").order("RANDOM()")
		else
			@item = Subcategory.find(params[:subcategory_id]).items.where(active: "active").order("RANDOM()")
		end
		unless @item.kind_of?(Array)
			@item = @item.page(params[:page]).per(18)
		else
			@item = Kaminari.paginate_array(@item).page(params[:page]).per(18)
		end
		render :partial => 'result', :content_type => 'text/html'
	end

	def cart #Activated when the add to cart button is pressed
		if cookies[:id] != nil and Order.exists?(cookies[:id])
		else
			order_new = Order.create(:cart_status => "pending")
			order_new.save
			cookies[:id] = order_new.id
		end
		order_id = cookies[:id]
		
		duplicate = Orderitemrelation.where(order_id: order_id).where(item_id: params[:item_id])
		if duplicate.length == 0
			orderitemrelation = Orderitemrelation.create(:order_id => order_id, :item_id => params[:item_id], :quantity => 1)
		else
			quantity = duplicate.first.quantity  + 1
			duplicate.first.update(quantity: quantity) 
		end
		@relation = Order.find(order_id).orderitemrelations.length

		render :partial => 'cart', :content_type => 'text/html'
	end

	def cartdrop
		if cookies[:id] != nil and Order.exists?(cookies[:id])
			@list = Order.find(cookies[:id]).orderitemrelations
			@total_price = 0
			delta_price = 0
			total_duke_price = 0
			duke_delta_price = 0
			@list.each do |relation|
			delta_price = relation.quantity * relation.item.selling_price
			if relation.item.duke_price != nil and relation.item.duke_price != 0
				duke_delta_price = (relation.quantity * relation.item.duke_price) - delta_price
				total_duke_price = total_duke_price + duke_delta_price
			end
			@total_price = @total_price + delta_price
		end
		@saved = total_duke_price
		else
			@list = 0
		end
		render :partial => 'cartdrop', :content_type => 'text/html'
	end

	def delete_relation
		relation = Orderitemrelation.find(params[:id])
		relation.destroy

		@list = Order.find(cookies[:id]).orderitemrelations
		@total_price = 0
		delta_price = 0
		total_duke_price = 0
		duke_delta_price = 0
		@list.each do |relation|
			delta_price = relation.quantity * relation.item.selling_price
			if relation.item.duke_price != nil and relation.item.duke_price != 0
			duke_delta_price = (relation.quantity * relation.item.duke_price) - delta_price
			total_duke_price = total_duke_price + duke_delta_price
			end
			@total_price = @total_price + delta_price
		end
		@saved = total_duke_price
		render :partial => 'cartdrop', :content_type => 'text/html'
	end

	def cartcountupdate
		order_id = cookies[:id]
		@relation = Order.find(order_id).orderitemrelations.length
		render :partial => 'cart', :content_type => 'text/html'
	end

	def save_quantity
		relation_modify = Orderitemrelation.find(params[:orderitemrelation][:l_id])
		new_quantity = params[:quantity]
		relation_modify.update(:quantity => new_quantity)
		@list = Order.find(cookies[:id]).orderitemrelations
		redirect_to :action => 'cartdrop'
		#render :partial => 'cartdrop', :content_type => 'text/html'
	end
end
