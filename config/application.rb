require File.expand_path('../boot', __FILE__)

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
#Bundler.require(*Rails.groups(:assets => %w(development test)))
    Bundler.require(:default, :assets, Rails.env)

module Gro
  class Application < Rails::Application
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.

    # Set Time.zone default to the specified zone and make Active Record auto-convert to this zone.
    # Run "rake -D time" for a list of tasks for finding time zone names. Default is UTC.
    config.time_zone = 'Eastern Time (US & Canada)'

    # The default locale is :en and all translations from config/locales/*.rb,yml are auto loaded.
    # config.i18n.load_path += Dir[Rails.root.join('my', 'locales', '*.{rb,yml}').to_s]
    # config.i18n.default_locale = :de

    # For devise
    config.assets.initialize_on_precompile = false

    config.assets.precompile += ['active_admin.css', 'active_admin.js.coffee'] 



    # Precompile additional assets. Defaults to [application.js, application.css, non-JS/CSS]
    #config.assets.precompile += ['active_admin.css.scss', 'active_admin.js'] 
end
end
