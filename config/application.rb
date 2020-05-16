require_relative 'boot'

require 'rails/all'

Bundler.require(*Rails.groups)

module Juarezlustosa
  class Application < Rails::Application
    config.load_defaults 6.0

    config.active_record.observers = [ :"Admin::OfferObserver" ]

    config.i18n.enforce_available_locales = true
    config.i18n.load_path += Dir[Rails.root.join(
      'config', 'locales', '**', '*.{rb,yml}'
    ).to_s]
  end
end
