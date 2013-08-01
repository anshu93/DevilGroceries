Gro::Application.routes.draw do
	devise_for :admin_users, ActiveAdmin::Devise.config
	ActiveAdmin.routes(self)
	root "shopping#home"
	
	match "welcome/home" => "welcome#home", :via => [:get]
	match "welcome/about" => "welcome#about", :via => [:get]
	match "welcome/contact" => "welcome#contact", :via => [:get]
	match "welcome/faqs" => "welcome#faqs", :via => [:get]

	match "shopping/result" => "shopping#result", :via => [:get]
end
