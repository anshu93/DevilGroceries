source 'https://rubygems.org'
ruby "2.0.0"


gem 'rails', '4.0.0'
gem 'turbolinks'
gem 'jquery-rails'
gem 'protected_attributes'

group :development do
	gem 'sqlite3'
end

group :production do
	gem 'pg'
	gem 'thin'
	gem 'rails_12factor'
	#gem 'newrelic_rpm'
end

group :assets do
	gem 'sass-rails'
	gem 'coffee-rails', '~> 4.0.0'
	gem 'coffee-script-source', '~> 1.4.0' # ADD THIS LINE, 1.5.0 doesn't compile ActiveAdmin JavaScript files
	gem 'uglifier', '>= 1.3.0'
end

