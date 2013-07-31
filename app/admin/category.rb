ActiveAdmin.register Category do
	index do
		column :category_name do |category|
			link_to category.category_name, admin_category_path(category)
		end
		default_actions
	end




	show :title => :category_name do
		panel "Subcategories" do
			table_for category.subcategories do |s|
				s.column("Subcategory name") { |subcategory| link_to subcategory.subcategory_name, admin_subcategory_path(subcategory)}
			end
		end
	end
end
