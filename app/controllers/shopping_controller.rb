class ShoppingController < ApplicationController
	def home
		@category = Category.all
		@subcategory = Subcategory.all
		@item = Item.all
		@order = Order.all
	end
end
