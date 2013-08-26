class UserMailer < ActionMailer::Base
  default from: "anshuman"
  def confirmation(order)
  	@order = order
  	@list = @order.orderitemrelations
  	mail(:to => order.email, :subject => "Order Confirmation")
  end
end
