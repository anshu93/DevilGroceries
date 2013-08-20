ActiveAdmin.register Faq do

		index do
		selectable_column
		column :question
		column :answer
		default_actions
		end


		form :html => { :enctype => "multipart/form-data" } do |f|
		f.inputs "FAQ question answer" do
			f.input :question
			f.input :answer
		end
		f.buttons
	end
end
