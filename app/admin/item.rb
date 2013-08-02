ActiveAdmin.register Item do
	index do
		selectable_column
		column :name
		column :selling_price
		column :supply_price
		column :duke_price
		column :active
		column "Image" do |item|
			link_to(image_tag(item.image.url(), :height => '60' ), admin_item_path(item))
		end
 		default_actions
	end

	form :html => { :enctype => "multipart/form-data" } do |f|
		f.inputs "Item details" do
			f.input :name
			f.input :selling_price
			f.input :supply_price
			f.input :duke_price
			f.input :category
			f.input :subcategory
			f.input :unit
			f.input :active, :label => "status", :as => :select, :collection => Item::ITEM_STATUS
			f.input :image, :as => :file, :hint => f.template.image_tag(f.object.image.url(:original))
		end
		f.buttons
	end
end
