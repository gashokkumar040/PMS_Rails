require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module PMSThree
  class Application < Rails::Application
    # config.api_only = true
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 5.2

    # config.time_zone = 'Central Time (US & Canada)'
    config.time_zone = 'Kolkata'

    # config.session_store :cookie_store
    # config.middleware.use ActionDispatch::Cookies
    # config.middleware.use ActionDispatch::Session::CookieStore, config.session_options
    # config.middleware.use Rack::MethodOverride

    
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration can go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded after loading
    # the framework and any gems in your application.
  end
end
