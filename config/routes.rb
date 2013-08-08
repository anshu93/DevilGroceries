Gro::Application.routes.draw do
	devise_for :admin_users, ActiveAdmin::Devise.config
	ActiveAdmin.routes(self)
	root "shopping#home"
	
	match "welcome/home" => "welcome#home", :via => [:get]
	match "welcome/about" => "welcome#about", :via => [:get]
	match "welcome/contact" => "welcome#contact", :via => [:get]
	match "welcome/faqs" => "welcome#faqs", :via => [:get]

	match "shopping/result" => "shopping#result", :via => [:get]
	match "shopping/cart" => "shopping#cart", :via => [:get]
	match "shopping/cartdrop" => "shopping#cartdrop", :via => [:get]
	match "shopping/delete_relation" => "shopping#delete_relation", via: [:post]
	match "shopping/cartcountupdate" => "shopping#cartcountupdate", via: [:get]
	match "shopping/save_quantity" => "shopping#save_quantity", via: [:post]
end
