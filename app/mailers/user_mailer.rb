class UserMailer < ActionMailer::Base
  default from: "anshuman"
  def confirmation(order)
  	@order = order
  	if @order.campus == "East"
		@dorm = EastSchedule.where(:dorm => @order.building).first
	elsif @order.campus == "West"
		@dorm = WestSchedule.where(:dorm => @order.building).first
	else 
		@dorm = CentralSchedule.all.first
	end
  	@list = @order.orderitemrelations
    emailid = order.email + "@duke.edu"
  	mail(:to => emailid, :subject => "Order Confirmation")
  end
end
