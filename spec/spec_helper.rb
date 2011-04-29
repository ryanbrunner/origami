require 'rubygems'
require 'spork'

Spork.prefork do
  # This file is copied to spec/ when you run 'rails generate rspec:install'
  ENV["RAILS_ENV"] ||= 'test'
  require File.expand_path("../../config/environment", __FILE__)
  require 'rspec/rails'

  # Requires supporting ruby files with custom matchers and macros, etc,
  # in spec/support/ and its subdirectories.
  Dir[Rails.root.join("spec/support/**/*.rb")].each {|f| require f}

  RSpec.configure do |config|
    # == Mock Framework
    #
    # If you prefer to use mocha, flexmock or RR, uncomment the appropriate line:
    #
    # config.mock_with :mocha
    # config.mock_with :flexmock
    # config.mock_with :rr
    config.mock_with :rspec
		
		require 'database_cleaner'
		config.before(:suite) do
			DatabaseCleaner.strategy = :truncation
			DatabaseCleaner.orm = "mongoid"
		end
		
		config.before(:each) do
			DatabaseCleaner.clean
		end
		
  end
end

Spork.each_run do
  # This code will be run each time you run your specs.
  
end





