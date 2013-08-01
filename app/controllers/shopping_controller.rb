class ShoppingController < ApplicationController
	def home
		@category = Category.all
		@subcategory = Subcategory.all
		@item = Item.all
		@order = Order.all
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
			@item = @item.page(params[:page]).per(2)
		else
			@item = Kaminari.paginate_array(@item).page(params[:page]).per(2)
		end
		render :partial => 'result', :content_type => 'text/html'
	end
end
