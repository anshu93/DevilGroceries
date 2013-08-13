class BuyController < ApplicationController
	def checkout
		if cookies[:id] != nil and Order.exists?(cookies[:id])
			@order = Order.find(cookies[:id])
			@list = @order.orderitemrelations
		else
			@list = 0
		end
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
	end

	def purchased
		id = params[:order][:order_id]
		name = params[:order][:user_id]
		@campus = params[:order][:campus]
		building = params[:order][:building]
		room = params[:order][:room]
		phone = params[:order][:phone]
		email = params[:order][:email]
		if Order.exists?(id)
			order = Order.find(id)
			order.update(:user_id => name, :campus => @campus, :building => building, :room => room, :phone => phone, :email => email, :date => Date.today.strftime("%m/%d/%Y"), :time => Time.now.to_s(:time), :status => "undelivered", :cart_status => "confirmed")
		end
	end
end