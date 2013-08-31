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

	def continue
		id = params[:order][:order_id]
		campus = params[:campus]
		order = Order.find(id).update(:campus => campus)
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
	    @order.update(:total => @total_price)
	    if @order.campus == "East"
	    	@schedules = EastSchedule.all
	    elsif @order.campus == "West"
	    	@schedules = WestSchedule.all
	    else
	    	@schedules = CentralSchedule.all
	    end
	end

	def refill
		id = cookies[:id]
		@order = Order.find(id)
		if @order.campus == "East"
	    	@schedules = EastSchedule.all
	    elsif @order.campus == "West"
	    	@schedules = WestSchedule.all
	    else
	    	@schedules = CentralSchedule.all
	    end
	end

	def purchased
		id = params[:order][:order_id]
		order = Order.find(id)
		# Check name
		if params[:order][:user_id] == ""
			redirect_to :action => "refill" and return
		end

		# Check email
		if params[:order][:email] == ""
			redirect_to :action => "refill" and return
		end

		# Check house number
		if params[:order][:house] == "" and order.campus == "West"
			redirect_to :action => "refill" and return
		end

		# Check room number
		if params[:order][:room] == "" and order.campus != "East"
			redirect_to :action => 'refill' and return
		end

		name = params[:order][:user_id]
		building = params[:building]
		room = params[:order][:room]
		email = params[:order][:email]

		if params[:order][:room] != nil
			room = params[:order][:room]
		else
			room = "N/A"
		end

		if params[:order][:house] != nil
			house = params[:order][:house]
		else
			house = "N/A"
		end

		t = Time.new(2013, 10, 31, 17, 00, 00).hour #Cutoff after 17:00 hrs

		if Time.now.hour < t #Change to alter delivery date
			cutoff = 1
		else 
			cutoff = 0
		end

		if Time.now.saturday? and cutoff == 1 		#If it's a saturday and before 5pm
			delivery_date = Date.today.end_of_week
		elsif Time.now.sunday? 
			delivery_date = Date.today.next_week.end_of_week
		else
			delivery_date = Date.today.end_of_week
		end


		if Order.exists?(id)
			@order = Order.find(id)
			@order.update(:user_id => name, :building => building, :room => room, :house => house, :email => email, :date => Date.today.strftime("%m/%d/%Y"), :time => Time.now.to_s(:time), :status => "undelivered", :cart_status => "confirmed", :delivery_date => delivery_date)
			UserMailer.confirmation(@order).deliver
			cookies.delete :id
			if @order.campus == "East"
				@dorm = EastSchedule.where(:dorm => @order.building).first
			elsif @order.campus == "West"
				@dorm = WestSchedule.where(:dorm => @order.building).first
			else 
				@dorm = CentralSchedule.all.first
			end
		end
	end


end
