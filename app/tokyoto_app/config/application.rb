require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module TokyotoApp
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 6.0

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration can go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded after loading
    # the framework and any gems in your application.
    config.generators do |g|
      g.assets false
      g.helper false
      g.test_framework false
      g.skip_routes false
    end

    config.generators do |g|
      g.test_framework :rspec,
        view_spec: false,
        helper_spec: false,
        request_spec: false,
        routing_spec: false
    end
  end
end
