class UserMailer < ActionMailer::Base
  default from: "anshuman"
  def confirmation(user)
  	@user = user
  	mail(:to => user.email, :subject => "Welcome")
  end
end
