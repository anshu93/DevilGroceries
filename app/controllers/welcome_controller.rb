class WelcomeController < ApplicationController
	def home
	end
	def contact
	end
	def faqs
	end
	def about
	end
	def delivery_schedule
		@east = EastSchedule.all.reverse
		@west = WestSchedule.all.reverse
		@central = CentralSchedule.all
	end
end
