# coding: utf-8

# Copyright (c) 2012 Red (E) Tools Ltd.
#
# Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:
#
# The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

require File.expand_path('../boot', __FILE__)

require 'rails/all'

if defined?(Bundler)
  # If you precompile assets before deploying to production, use this line
  Bundler.require(*Rails.groups(:assets => %w(development test)))
  # If you want your assets lazily compiled in production, use this line
  # Bundler.require(:default, :assets, Rails.env)
end

module SalorHospitality
  class Application < Rails::Application

    VERSION = '{{VERSION}}'

    INITIAL_CREDITS = 100
    LANGUAGES = { 'en' => 'English', 'gn' => 'Deutsch', 'tr' => 'Türkçe', 'fr' => 'Français', 'es' => 'Español', 'pl' => 'Polski', 'hu' => 'Magyar', 'el' => 'Greek', 'ru' => 'Русский', 'it' => 'Italiana', 'cn' => 'Chinese'}
    COUNTRIES = { 'cc' => :default, 'de' => 'Deutschland', 'at' => 'Österreich', 'tr' => 'Türkiye', 'fr' => 'France', 'es' => 'España', 'pl' => 'Polska', 'hu' => 'Magyarország', 'el' => 'Ελλάδα', 'ru' => 'Россия', :it => 'Italia', 'cn' => 'China', 'us' => 'USA', 'gb' => 'England' }
    COUNTRIES_REGIONS = { 'cc' => 'en-us', 'de' => 'gn-de', 'at' => 'gn-de', 'tr' => 'tr-tr', 'fr' => 'fr-fr', 'es' => 'es-es', 'pl' => 'pl-pl', 'hu' => 'hu-hu', 'el' => 'el-el', 'ru' => 'ru-ru', 'it' => 'it-it', 'cn' => 'cn-cn', 'us' => 'en-us', 'gb' => 'en-gb' }
    
    FONTS = Dir.glob(File.join(Rails.root,'public','fonts','*.ttf')).collect{ |f| "#{ /fonts\/(.*).ttf/.match(f)[1]}" }
    
    SALOR_HOSPITALITY_CONFIGURATION = {}
    SALOR_HOSPITALITY_CONFIGURATION = YAML::load(File.open(File.join('etc','salor-hospitality-config.yml'), 'r').read) if File.exists?(File.join('etc','salor-hospitality-config.yml'))

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.

    # Custom directories with classes and modules you want to be autoloadable.

    # Only load the plugins named here, in the order given (default is alphabetical).
    # :all can be used as a placeholder for all plugins not explicitly named.
    # config.plugins = [ :exception_notification, :ssl_requirement, :all ]

    # Activate observers that should always be running.
    # config.active_record.observers = :cacher, :garbage_collector, :forum_observer

    # Set Time.zone default to the specified zone and make Active Record auto-convert to this zone.
    # Run "rake -D time" for a list of tasks for finding time zone names. Default is UTC.
    config.time_zone = 'Vienna'

    # The default locale is :en and all translations from config/locales/*.rb,yml are auto loaded.
    # config.i18n.load_path += Dir[Rails.root.join('my', 'locales', '*.{rb,yml}').to_s]
    # config.i18n.default_locale = :de

    # Configure the default encoding used in templates for Ruby 1.9.
    config.encoding = "utf-8"

    # Configure sensitive parameters which will be filtered from the log file.
    config.filter_parameters += [:password]

    # Enable the asset pipeline
    config.assets.enabled = true

    # Version of your assets, change this if you want to expire all your assets
    config.assets.version = '1.0'

    config.active_record.observers = [:history_observer]
  end
end