class ShoppingController < ApplicationController
	def home
		@category = Category.all
		@subcategory = Subcategory.all

		ip = require 'JSON';require 'open-uri';puts open( 'http://jsonip.com/ ' ){ |s| JSON::parse( s.string())['ip'] };
		present = false
		@relation = 0
		Order.all.each do |o|
			if o.user_id == ip
				@relation = Orderitemrelation.where(order_id: o.id).length
			end
		end
	end

	def result
		if params[:category_id] == "-1"
			@item = Item.order("RANDOM()")
		elsif params[:category_id] != nil
			@item = Category.find(params[:category_id]).items.order("RANDOM()")
		else
			@item = Subcategory.find(params[:subcategory_id]).items.order("RANDOM()")
		end
		unless @item.kind_of?(Array)
			@item = @item.page(params[:page]).per(18)
		else
			@item = Kaminari.paginate_array(@item).page(params[:page]).per(18)
		end
		render :partial => 'result', :content_type => 'text/html'
	end

	def cart #Activated when the add to cart button is pressed
		ip = require 'JSON';require 'open-uri';puts open( 'http://jsonip.com/ ' ){ |s| JSON::parse( s.string())['ip'] };
		present = false
		Order.all.each do |o|
			if o.user_id == ip
				present = true
			end
		end
		if present == false
			order = Order.create(:user_id => ip, :cart_status => "pending")
			order.save
		else
			order = Order.where(user_id: ip).first
		end
		@duplicate = Orderitemrelation.where(order_id: order.id).where(item_id: params[:item_id])
		if @duplicate.length == 0
			orderitemrelation = Orderitemrelation.create(:order_id => order.id, :item_id => params[:item_id], :quantity => 1)
		else
			@quantity = @duplicate.first.quantity  + 1
			@duplicate.first.update(quantity: @quantity) 
		end
		@relation = order.orderitemrelations.length
		render :partial => 'cart', :content_type => 'text/html'
	end
end
