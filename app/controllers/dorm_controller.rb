class DormController < ApplicationController
	def for_dormid
 		@dorms = Dorm.where(campus_id: params[:id])
		respond_to do |format|
			format.json {render :json => @dorms}
		end
	end
end
